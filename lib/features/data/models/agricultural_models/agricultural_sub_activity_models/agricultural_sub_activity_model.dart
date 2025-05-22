import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';

class AgriculturalSubActivityModel extends AgriculturalSubActivityEntity {
  const AgriculturalSubActivityModel({
    required super.id,
    super.name,
    super.description,
    super.isDefault,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'isDefault': isDefault,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };

  factory AgriculturalSubActivityModel.fromMap(Map<String, dynamic> map) =>
      AgriculturalSubActivityModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        isDefault: map['isDefault'],
        createdAt: map['createdAt'] == null ? null : map['createdAt'] as String,
        updatedAt: map['updatedAt'] == null ? null : map['updatedAt'] as String,
        deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      );

  String toJson() => json.encode(toMap());

  factory AgriculturalSubActivityModel.fromJson(String source) =>
      AgriculturalSubActivityModel.fromMap(json.decode(source));

  factory AgriculturalSubActivityModel.fromEntity(AgriculturalSubActivityEntity entity) =>
      AgriculturalSubActivityModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        isDefault: entity.isDefault,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        deletedAt: entity.deletedAt,
      );
}
