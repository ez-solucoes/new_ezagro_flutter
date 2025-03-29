import 'dart:convert';

import '../../../domain/entities/purchase_request_entities/purchase_request_type_entity.dart';

class PurchaseRequestTypeModel extends PurchaseRequestTypeEntity {
  const PurchaseRequestTypeModel({
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

  factory PurchaseRequestTypeModel.fromMap(Map<String, dynamic> map) {
    return PurchaseRequestTypeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseRequestTypeModel.fromJson(String source) =>
      PurchaseRequestTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}