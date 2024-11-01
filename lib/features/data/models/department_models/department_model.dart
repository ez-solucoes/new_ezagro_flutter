import 'dart:convert';

import '../../../domain/entities/departmentEntities/department_entity.dart';

class DepartmentModel extends DepartmentEntity {
  const DepartmentModel({
    required super.id,
    super.subDepartments,
    super.name,
    super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'subDepartments': subDepartments,
      };

  factory DepartmentModel.fromMap(Map<String, dynamic> map) => DepartmentModel(
        id: map['id'],
        subDepartments: null,
        //map['subDepartments'] == null ? null : List<String>.from(map['subDepartments']),
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source));
}
