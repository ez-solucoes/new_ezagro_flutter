import 'dart:convert';

import '../../../domain/entities/purchase_request_entities/purchase_request_status_entity.dart';

class PurchaseRequestStatusModel extends PurchaseRequestStatusEntity {
  const PurchaseRequestStatusModel({
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

  factory PurchaseRequestStatusModel.fromMap(Map<String, dynamic> map) {
    return PurchaseRequestStatusModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseRequestStatusModel.fromJson(String source) =>
      PurchaseRequestStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);
}