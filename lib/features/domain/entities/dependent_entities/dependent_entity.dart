import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity.dart';

class DependentEntity extends Equatable{
  final int id;
  final EmployeeEntity employee;
  final String name;
  final String relationship;
  final String dateOfBirth;

  const DependentEntity({
    required this.id,
    required this.employee,
    required this.name,
    required this.relationship,
    required this.dateOfBirth,
});

  @override
  List<Object?> get props => [
    id,
    employee,
    name,
    relationship,
    dateOfBirth,
  ];
}