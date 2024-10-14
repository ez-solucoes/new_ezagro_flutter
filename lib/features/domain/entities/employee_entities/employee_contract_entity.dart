import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/departmentEntities/department_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_composition_salary_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_contract_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/shift_entity/shift_entity.dart';

class EmployeeContractEntity extends Equatable{
  final int id;
  final EmployeeContractTypeEntity type;
  final double number;
  final String file;
  final String dtAdmission;
  final String dtDismissal;
  final String function;
  final DepartmentEntity department;
  final ShiftEntity shift;
  final double baseSalary;
  final double combinedSalary;
  final double variedSalary;
  final double alimonyPercentage;
  final double valueTicket;
  final int additionalUnhealthy;
  final int additionalDanger;
  final bool trustPosition;
  final String dismissalReason;
  final List<EmployeeCompositionSalaryEntity> employeeCompositionSalary;

  const EmployeeContractEntity({
    required this.id,
    required this.type,
    required this.number,
    required this.file,
    required this.dtAdmission,
    required this.dtDismissal,
    required this.function,
    required this.department,
    required this.shift,
    required this.baseSalary,
    required this.combinedSalary,
    required this.variedSalary,
    required this.alimonyPercentage,
    required this.valueTicket,
    required this.additionalUnhealthy,
    required this.additionalDanger,
    required this.trustPosition,
    required this.dismissalReason,
    required this.employeeCompositionSalary,
});

  @override
  List<Object?> get props => [
  id,
  type,
  number,
  file,
  dtAdmission,
  dtDismissal,
  function,
  department,
  shift,
  baseSalary,
  combinedSalary,
  variedSalary,
  alimonyPercentage,
  valueTicket,
  additionalUnhealthy,
  additionalDanger,
  trustPosition,
  dismissalReason,
  employeeCompositionSalary,
  ];
}