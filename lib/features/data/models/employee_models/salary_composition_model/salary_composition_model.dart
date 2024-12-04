import 'dart:convert';

import '../../../../domain/entities/employee_entities/salary_composition_entity/salary_composition_entity.dart';

class SalaryCompositionModel extends SalaryCompositionEntity {
  const SalaryCompositionModel({
    required super.id,
    super.composition,
    super.compositionReference,
    super.baseReferenceId,
    super.employeeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'composition': composition,
      'compositionReference': compositionReference,
      'baseReferenceId': baseReferenceId,
      'employeeId': employeeId,
    };
  }

  factory SalaryCompositionModel.fromMap(Map<String, dynamic> map) {
    var compositionReference = map['compositionReference'];
    if (compositionReference is int) {
      compositionReference = compositionReference.toDouble();
    }

    return SalaryCompositionModel(
      id: map['id'] as int,
      composition: map['composition'] as String?,
      compositionReference: compositionReference as double?,
      baseReferenceId: map['baseReferenceId'] as int?,
      employeeId: map['employeeId'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SalaryCompositionModel.fromJson(String source) =>
      SalaryCompositionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}