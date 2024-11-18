import 'package:equatable/equatable.dart';

class SelectorEntity extends Equatable {
  final int id;
  final String? name;

  const SelectorEntity({required this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}