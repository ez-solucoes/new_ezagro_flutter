import 'package:equatable/equatable.dart';

import '../sort_info_entity/sort_info_entity.dart';

class PaginationEntity<T> extends Equatable {
  final int? totalPages;
  final int? totalElements;
  final int? size;
  final List<T> content;
  final int? number;
  final bool? first;
  final bool? last;
  final bool? empty;
  final SortInfoEntity? sort;
  final int? numberOfElements;

  const PaginationEntity({
    this.totalPages,
    this.totalElements,
    this.size,
    required this.content,
    this.number,
    this.first,
    this.last,
    this.empty,
    this.sort,
    this.numberOfElements,
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
