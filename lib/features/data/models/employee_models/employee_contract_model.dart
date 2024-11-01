import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_contract_entity.dart';
import '../department_models/department_model.dart';
import '../shift_models/shift_model.dart';
import 'employee_composition_salary_model.dart';
import 'employee_contract_type_model.dart';

class EmployeeContractModel extends EmployeeContractEntity {
  const EmployeeContractModel({
    required super.id,
    super.type,
    super.number,
    super.file,
    super.dtAdmission,
    super.dtDismissal,
    super.function,
    super.department,
    super.shift,
    super.baseSalary,
    super.combinedSalary,
    super.variedSalary,
    super.alimonyPercentage,
    super.valueTicket,
    super.additionalUnhealthy,
    super.additionalDanger,
    super.trustPosition,
    super.dismissalReason,
    super.employeeCompositionSalary,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': (type as EmployeeContractTypeModel).toMap(),
        'number': number,
        'file': file,
        'dtAdmission': dtAdmission,
        'dtDismissal': dtDismissal,
        'function': function,
        'department': (department as DepartmentModel).toMap(),
        'shift': (shift as ShiftModel).toMap(),
        'baseSalary': baseSalary,
        'combinedSalary': combinedSalary,
        'variedSalary': variedSalary,
        'alimonyPercentage': alimonyPercentage,
        'valueTicket': valueTicket,
        'additionalUnhealthy': additionalUnhealthy,
        'additionalDanger': additionalDanger,
        'trustPosition': trustPosition,
        'dismissalReason': dismissalReason,
        'employeeCompositionSalary': employeeCompositionSalary
            ?.map((e) => (e as EmployeeCompositionSalaryModel).toMap())
            .toList(),
      };

  factory EmployeeContractModel.fromMap(Map<String, dynamic> map) =>
      EmployeeContractModel(
        id: map['id'],
        type: map['type'] == null
            ? null
            : EmployeeContractTypeModel.fromMap(map['type']),
        number: map['number'],
        file: map['file'],
        dtAdmission: map['dtAdmission'],
        dtDismissal: map['dtDismissal'],
        function: map['function'],
        department: map['department'] == null
            ? null
            : DepartmentModel.fromMap(map['department']),
        shift: map['shift'] == null ? null : ShiftModel.fromMap(map['shift']),
        baseSalary: map['baseSalary'] == null
            ? null
            : (map['baseSalary'] is double
                ? map['baseSalary']
                : (map['baseSalary'] as int).toDouble()),
        combinedSalary: map['combinedSalary'],
        variedSalary: map['variedSalary'],
        alimonyPercentage: map['alimonyPercentage'],
        valueTicket: map['valueTicket'],
        additionalUnhealthy: map['additionalUnhealthy'],
        additionalDanger: map['additionalDanger'],
        trustPosition: map['trustPosition'],
        dismissalReason: map['dismissalReason'],
        employeeCompositionSalary: List<EmployeeCompositionSalaryModel>.from(
            map['employeeCompositionSalary']
                ?.map((x) => EmployeeCompositionSalaryModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory EmployeeContractModel.fromJson(String source) =>
      EmployeeContractModel.fromMap(json.decode(source));
}
