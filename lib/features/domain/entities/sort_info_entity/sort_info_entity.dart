import 'package:equatable/equatable.dart';

class SortInfoEntity extends Equatable {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  const SortInfoEntity(
      {required this.empty, required this.sorted, required this.unsorted});

  @override
  List<Object?> get props => [empty, sorted, unsorted];
}
