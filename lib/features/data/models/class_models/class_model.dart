import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

class ClassModel extends ClassEntity {
  const ClassModel(
      {required super.id,
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

  factory ClassModel.fromMap(Map<String, dynamic> map) {
      return ClassModel(
          id: map['id'] as int,
          name: map['name'] as String,
          slug: map['slug'] as String,
          createdAt: map['createdAt'] as String,
          updatedAt: map['updatedAt'] as String,
          deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
