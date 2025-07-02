import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_item_entity.dart';

class StockItemModel extends StockItemEntity {
  const StockItemModel({
    required super.id,
    required super.expiresAt,
    required super.alertQuantity,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expiresAt': expiresAt,
      'alertQuantity': alertQuantity,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory StockItemModel.fromMap(Map<String, dynamic> map) {
    return StockItemModel(
      id: map['id'] as int,
      expiresAt: map['expiresAt'] as String?,
      alertQuantity: map['alertQuantity'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockItemModel.fromJson(String source) =>
      StockItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
