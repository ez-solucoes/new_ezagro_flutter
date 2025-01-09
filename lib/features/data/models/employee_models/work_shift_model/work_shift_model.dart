import 'dart:convert';

import '../../../../domain/entities/employee_entities/work_shift_entity/work_shift_entity.dart';

class WorkShiftModel extends WorkShiftEntity {
  const WorkShiftModel({
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

  factory WorkShiftModel.fromMap(Map<String, dynamic> map) {
    return WorkShiftModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkShiftModel.fromJson(String source) =>
      WorkShiftModel.fromMap(json.decode(source) as Map<String, dynamic>);
}