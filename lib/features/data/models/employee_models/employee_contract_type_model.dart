import 'dart:convert';

import '../../../domain/entities/employee_entities/employee_contract_type_entity.dart';

class EmployeeContractTypeModel extends EmployeeContractTypeEntity {
  const EmployeeContractTypeModel({
    required super.id,
    super.name,
    super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory EmployeeContractTypeModel.fromMap(Map<String, dynamic> map) =>
      EmployeeContractTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory EmployeeContractTypeModel.fromJson(String source) =>
      EmployeeContractTypeModel.fromMap(json.decode(source));
}
