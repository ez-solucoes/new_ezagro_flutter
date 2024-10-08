import 'package:equatable/equatable.dart';

class FieldServiceOrderTypeEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final bool active;

  const FieldServiceOrderTypeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        active,
      ];
}
