import 'dart:convert';

import '../../../domain/entities/pagination_entity/pagination_entity.dart';
import '../../../domain/entities/sort_info_entity/sort_info_entity.dart';
import '../sort_info_model/sort_info_model.dart';

class PaginationModel<T> extends PaginationEntity<T> {
  final int totalPages;
  final int totalElements;
  final int size;
  final List<T> content;
  final int number;
  final bool first;
  final bool last;
  final bool empty;
  final SortInfoEntity sort;
  final int numberOfElements;

  const PaginationModel({
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.content,
    required this.number,
    required this.first,
    required this.last,
    required this.empty,
    required this.sort,
    required this.numberOfElements,
  }) : super(
    totalPages: totalPages,
    totalElements: totalElements,
    size: size,
    content: content,
    number: number,
    first: first,
    last: last,
    empty: empty,
    sort: sort,
    numberOfElements: numberOfElements,
  );

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
