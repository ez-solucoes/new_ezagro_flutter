import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_composition_salary_entity.dart';

class EmployeeCompositionSalaryModel extends EmployeeCompositionSalaryEntity {
  const EmployeeCompositionSalaryModel({
    required super.id,
    super.salaryComposition,
    super.salaryCompositionReference,
    super.salaryReferenceBase,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'salaryComposition': salaryComposition,
        'salaryCompositionReference': salaryCompositionReference,
        'salaryReferenceBase': salaryReferenceBase,
      };

  factory EmployeeCompositionSalaryModel.fromMap(Map<String, dynamic> map) =>
      EmployeeCompositionSalaryModel(
        id: map['id'],
        salaryComposition: map['salaryComposition'],
        salaryCompositionReference: map['salaryCompositionReference'] == null
            ? null
            : (map['salaryCompositionReference'] is double
                ? map['salaryCompositionReference']
                : (map['salaryCompositionReference'] as int).toDouble()),
        salaryReferenceBase: map['salaryReferenceBase'],
      );

  String toJson() => json.encode(toMap());

  factory EmployeeCompositionSalaryModel.fromJson(String source) =>
      EmployeeCompositionSalaryModel.fromMap(json.decode(source));
}
