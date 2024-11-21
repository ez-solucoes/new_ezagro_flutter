import 'package:equatable/equatable.dart';

class SelectorEntity extends Equatable {
  final int value;
  final String? label;

  const SelectorEntity({required this.value, this.label});

  @override
  List<Object?> get props => [value, label];
}