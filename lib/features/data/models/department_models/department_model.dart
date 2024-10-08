import 'dart:convert';

import '../../../domain/entities/departmentEntities/department_entity.dart';

class DepartmentModel extends DepartmentEntity {
  const DepartmentModel(
      super.subDepartments, {
        required super.id,
        required super.name,
        required super.description,
      });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'subDepartments': subDepartments,
  };

  factory DepartmentModel.fromMap(Map<String, dynamic> map) => DepartmentModel(
    List<String>.from(map['subDepartments']),
    id: map['id'],
    name: map['name'],
    description: map['description'],
  );

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source));
}