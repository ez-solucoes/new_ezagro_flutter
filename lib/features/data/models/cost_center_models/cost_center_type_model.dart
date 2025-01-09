import 'dart:convert';
import '../../../domain/entities/cost_center_entities/cost_center_type_entity.dart';

class CostCenterTypeModel extends CostCenterTypeEntity {
  const CostCenterTypeModel({
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

  factory CostCenterTypeModel.fromMap(Map<String, dynamic> map) {
    return CostCenterTypeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CostCenterTypeModel.fromJson(String source) =>
      CostCenterTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}