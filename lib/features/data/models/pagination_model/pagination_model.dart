import 'dart:convert';

import '../../../domain/entities/pagination_entity/pagination_entity.dart';
import '../sort_info_model/sort_info_model.dart';

class PaginationModel<T> extends PaginationEntity<T> {
  const PaginationModel({
    super.totalPages,
    super.totalElements,
    super.size,
    required super.content,
    super.number,
    super.first,
    super.last,
    super.empty,
    super.sort,
    super.numberOfElements,
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
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
      totalElements: map['totalElements']!= null ? map['totalElements'] as int : null,
      size: map['size'] != null ? map['size'] as int : null,
      content: (map['content'] as List<dynamic>)
          .map((e) => fromMapFunction(e as Map<String, dynamic>))
          .toList(),
      number: map['number'] != null ? map['number'] as int : null,
      first: map['first'] != null ? map['first'] as bool : null,
      last: map['last'] != null ? map['last'] as bool : null,
      empty: map['empty'] != null ? map['empty'] as bool : null,
      sort: map['sort'] != null ? SortInfoModel.fromMap(map['sort'] as Map<String, dynamic>) : null,
      numberOfElements: map['numberOfElements'] != null ? map['numberOfElements'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(
      String source, T Function(Map<String, dynamic>) fromMapFunction) {
    return PaginationModel.fromMap(json.decode(source), fromMapFunction);
  }
}
