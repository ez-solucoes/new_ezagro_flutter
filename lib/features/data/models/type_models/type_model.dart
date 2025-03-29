import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../category_models/category_model.dart';

class TypeModel extends TypeEntity {
  const TypeModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'category': category,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
        id: map['id'] as int,
        name: map['name'] as String,
        slug: map['slug'] as String,
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String,
        deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
        category: map['category'] == null ? null : CategoryModel.fromMap(map['category'])as CategoryModel?);
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
