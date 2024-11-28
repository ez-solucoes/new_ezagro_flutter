import 'package:equatable/equatable.dart';

class PaginationEntity<T> extends Equatable {
  final int? page;
  final int? pageSize;
  final int? total;

  const PaginationEntity({
    this.page,
    this.pageSize,
    this.total,
  });

  @override
  List<Object?> get props => [
        page,
        pageSize,
        total,
      ];
}
