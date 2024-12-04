import 'dart:convert';
import '../../../../domain/entities/department_entities/sub_department_entity/sub_department_entity.dart';

class SubDepartmentModel extends SubDepartmentEntity {
  const SubDepartmentModel({
    required super.id,
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory SubDepartmentModel.fromMap(Map<String, dynamic> map) {
    return SubDepartmentModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      description: map['description'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubDepartmentModel.fromJson(String source) =>
      SubDepartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}