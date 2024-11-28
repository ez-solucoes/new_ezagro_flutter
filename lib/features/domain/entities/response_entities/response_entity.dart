import 'package:equatable/equatable.dart';

import '../pagination_entity/pagination_entity.dart';
import '../sort_entity/sort_entity.dart';

class ResponseEntity<T> extends Equatable {
  final T? data;
  final String? message;
  final String? path;
  final int? status;
  final PaginationEntity? pagination;
  final SortEntity? sort;

  const ResponseEntity({
    this.data,
    this.message,
    this.path,
    this.status,
    this.pagination,
    this.sort,
  });

  @override
  List<Object?> get props =>
      [
        data,
        message,
        path,
        status,
        pagination,
        sort,
      ];
}
