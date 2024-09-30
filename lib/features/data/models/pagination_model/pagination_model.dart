import 'dart:convert';
import '../../../domain/entities/pagination_entity/pagination_entity.dart';
import '../sort_info_model/sort_info_model.dart';

class PaginationModel<T> extends PaginationEntity<T> {

  const PaginationModel({
    required super.totalPages,
    required super.totalElements,
    required super.size,
    required super.content,
    required super.number,
    required super.first,
    required super.last,
    required super.empty,
    required super.sort,
    required super.numberOfElements,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalPages': totalPages,
      'totalElements': totalElements,
      'size': size,
      'content': content,
      'number': number,
      'first': first,
      'last': last,
      'empty': empty,
      'numberOfElements': numberOfElements,
    };
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map,
      T Function(Map<String, dynamic>) fromMapFunction) {
    return PaginationModel(
      totalPages: map['totalPages'] as int,
      totalElements: map['totalElements'] as int,
      size: map['size'] as int,
      content: (map['content'] as List<dynamic>)
          .map((e) => fromMapFunction(e))
          .toList(),
      number: map['number'] as int,
      first: map['first'] as bool,
      last: map['last'] as bool,
      empty: map['empty'] as bool,
      sort: SortInfoModel.fromMap(map['sort'] as Map<String, dynamic>),
      numberOfElements: map['numberOfElements'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(
      String source, T Function(Map<String, dynamic>) fromMapFunction) {
    return PaginationModel.fromMap(json.decode(source), fromMapFunction);
  }
}
