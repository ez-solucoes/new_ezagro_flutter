import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity.dart';

class DependentEntity extends Equatable {
  final int id;
  final EmployeeEntity? employee;
  final String? name;
  final String? relationship;
  final String? dateOfBirth;

  const DependentEntity({
    required this.id,
    this.employee,
    this.name,
    this.relationship,
    this.dateOfBirth,
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
