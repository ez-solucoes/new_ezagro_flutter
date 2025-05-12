import 'dart:convert';
import '../../../domain/entities/pix_entities/pix_type_entity.dart';


class PixTypeModel extends PixTypeEntity {
  const PixTypeModel({
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

  factory PixTypeModel.fromMap(Map<String, dynamic> map) {
    return PixTypeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PixTypeModel.fromJson(String source) =>
      PixTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}