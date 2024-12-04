import 'dart:convert';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_contract_type_entity/employee_contract_type_entity.dart';

class EmployeeContractTypeModel extends EmployeeContractTypeEntity {
  const EmployeeContractTypeModel({
    required super.id,
    super.name,
    super.slug,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory EmployeeContractTypeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeContractTypeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeContractTypeModel.fromJson(String source) =>
      EmployeeContractTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}