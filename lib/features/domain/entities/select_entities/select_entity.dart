import 'package:equatable/equatable.dart';

class SelectEntity extends Equatable {
  final int value;
  final String? label;

  const SelectEntity({required this.value, this.label});

  @override
  List<Object?> get props => [value, label];
}