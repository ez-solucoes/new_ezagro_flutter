import 'dart:convert';

import '../../../../domain/entities/department_entities/department_entity/department_entity.dart';
import '../../../../domain/entities/department_entities/sub_department_entity/sub_department_entity.dart';
import '../sub_department_model/sub_department_model.dart';


class DepartmentModel extends DepartmentEntity {
  const DepartmentModel({
    required super.id,
    super.name,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.subDepartments,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'subDepartments': subDepartments?.map((x) => (x as SubDepartmentModel).toMap()).toList(),
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
        id: map['id'] as int,
        name: map['name'] as String?,
        description: map['description'] as String?,
        createdAt: map['createdAt'] as String?,
        updatedAt: map['updatedAt'] as String?,
        deletedAt: map['deletedAt'] as String?,
        subDepartments: map['subDepartments'] != null ? List<SubDepartmentEntity>.from(map['subDepartments']?.map((x) => SubDepartmentModel.fromMap(x as Map<String, dynamic>))) : null
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) => DepartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}