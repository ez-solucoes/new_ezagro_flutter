import 'package:equatable/equatable.dart';

class EmployeeStatusEntity extends Equatable{
  final int id;
  final String name;
  final bool active;

  const EmployeeStatusEntity({
    required this.id,
    required this.name,
    required this.active,
});

  @override
  List<Object?> get props => [
    id,
    name,
    active,
  ];
}