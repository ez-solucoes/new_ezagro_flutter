import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/delivery_location_entities/delivery_location_entity.dart';

class DeliveryLocationModel extends DeliveryLocationEntity {
  const DeliveryLocationModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.createdAt,
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

  factory DeliveryLocationModel.fromMap(Map<String, dynamic> map) {
    return DeliveryLocationModel(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryLocationModel.fromJson(String source) =>
      DeliveryLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
