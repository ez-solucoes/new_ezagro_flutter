import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/status_entities/status_entity.dart';


class StatusModel extends StatusEntity {
  const StatusModel({
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

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) =>
      StatusModel.fromMap(json.decode(source) as Map<String, dynamic>);
}