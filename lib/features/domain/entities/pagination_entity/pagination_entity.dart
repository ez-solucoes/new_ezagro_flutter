import 'package:equatable/equatable.dart';

import '../sort_info_entity/sort_info_entity.dart';

class PaginationEntity<T> extends Equatable {
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

  const PaginationEntity({
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
  });

  @override
  List<Object?> get props => [
    totalPages,
    totalElements,
    size,
    content,
    number,
    first,
    last,
    empty,
    sort,
    numberOfElements,
  ];
}