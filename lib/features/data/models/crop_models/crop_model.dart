import 'dart:convert';

import '../../../domain/entities/crop_entities/crop_entity.dart';

class CropModel extends CropEntity {
  const CropModel({
    required super.id,
    super.name,
    super.description,
    super.active,
    super.slug,
    super.isPerennial,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'active': active,
        'slug': slug,
        'isPerennial': isPerennial,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };

  factory CropModel.fromMap(Map<String, dynamic> map) => CropModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
        slug: map['slug'],
        isPerennial: map['isPerennial'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
      );

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source));
}
