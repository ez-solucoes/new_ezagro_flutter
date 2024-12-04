import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';

class DependentEntity extends Equatable {
  final int id;
  final String? name;
  final String? birthDate;
  final int? dependentTypeId;
  final int? employeeId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const DependentEntity({
    required this.id,
    this.name,
    this.birthDate,
    this.dependentTypeId,
    this.employeeId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt
  });

  @override
  List<Object?> get props => [
        id,
        name,
        birthDate,
        dependentTypeId,
        employeeId,
        createdAt,
        updatedAt,
        deletedAt
      ];
}
