import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/departmentEntities/department_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_composition_salary_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_contract_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/shift_entity/shift_entity.dart';

class EmployeeContractEntity extends Equatable {
  final int id;
  final EmployeeContractTypeEntity? type;
  final int? number;
  final String? file;
  final String? dtAdmission;
  final String? dtDismissal;
  final String? function;
  final DepartmentEntity? department;
  final ShiftEntity? shift;
  final double? baseSalary;
  final double? combinedSalary;
  final double? variedSalary;
  final double? alimonyPercentage;
  final double? valueTicket;
  final int? additionalUnhealthy;
  final int? additionalDanger;
  final bool? trustPosition;
  final String? dismissalReason;
  final List<EmployeeCompositionSalaryEntity>? employeeCompositionSalary;

  const EmployeeContractEntity({
    required this.id,
    this.type,
    this.number,
    this.file,
    this.dtAdmission,
    this.dtDismissal,
    this.function,
    this.department,
    this.shift,
    this.baseSalary,
    this.combinedSalary,
    this.variedSalary,
    this.alimonyPercentage,
    this.valueTicket,
    this.additionalUnhealthy,
    this.additionalDanger,
    this.trustPosition,
    this.dismissalReason,
    this.employeeCompositionSalary,
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
