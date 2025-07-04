import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/items_entities/items_entity.dart';

class ItemsModel extends ItemsEntity {
  const ItemsModel({
    required super.productId,
    required super.requestedQuantity,
    super.agriculturalInputId,
    super.machineryImplementId,
    super.serviceName,
    super.description,
    super.attachmentUrls,
    super.productName,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'requestedQuantity': requestedQuantity,
      'agriculturalInputId': agriculturalInputId,
      'machineryImplementId': machineryImplementId,
      'serviceName': serviceName,
      'description': description,
      'attachmentUrls': attachmentUrls,
      'productName': productName,
    };
  }

  factory ItemsModel.fromMap(Map<String, dynamic> map) {
    return ItemsModel(
      productId: map['productId'] as int,
      requestedQuantity: map['requestedQuantity'] as int,
      agriculturalInputId: map['agriculturalInputId'] as int?,
      machineryImplementId: map['machineryImplementId'] as int?,
      serviceName: map['serviceName'] as String?,
      description: map['description'] as String?,
      attachmentUrls: (map['attachmentUrls'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      productName: map['productName'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsModel.fromJson(String source) =>
      ItemsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ItemsModel.fromEntity(ItemsEntity entity) {
    return ItemsModel(
      productId: entity.productId,
      requestedQuantity: entity.requestedQuantity,
      agriculturalInputId: entity.agriculturalInputId,
      machineryImplementId: entity.machineryImplementId,
      serviceName: entity.serviceName,
      description: entity.description,
      attachmentUrls: entity.attachmentUrls,
      productName: entity.productName,
    );
  }

}