import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/soil_stage_entities/soil_stage_entity.dart';

class SoilStageModel extends SoilStageEntity {
  const SoilStageModel({
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

  factory SoilStageModel.fromMap(Map<String, dynamic> map) {
    return SoilStageModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SoilStageModel.fromJson(String source) =>
      SoilStageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
