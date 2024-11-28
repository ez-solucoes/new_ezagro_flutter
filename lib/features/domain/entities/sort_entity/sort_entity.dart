import 'package:equatable/equatable.dart';

class SortEntity extends Equatable {
  final String? sortBy;
  final String? order;

  const SortEntity({
    this.sortBy,
    this.order,
  });

  @override
  List<Object?> get props => [
        sortBy,
        order,
      ];
}
