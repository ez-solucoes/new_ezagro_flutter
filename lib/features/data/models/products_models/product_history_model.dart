import 'dart:convert';

import '../../../domain/entities/products_entities/product_history_entity.dart';

class ProductHistoryModel extends ProductHistoryEntity {
  const ProductHistoryModel({
    required super.productHistoryId,
    required super.productId,
    required super.name,
    required super.description,
    required super.brand,
    required super.productCode,
  });

  Map<String, dynamic> toMap() => {
        'productHistoryId': productHistoryId,
        'productId': productId,
        'name': name,
        'description': description,
        'brand': brand,
        'productCode': productCode,
      };

  factory ProductHistoryModel.fromMap(Map<String, dynamic> map) =>
      ProductHistoryModel(
        productHistoryId: map['productHistoryId'],
        productId: map['productId'],
        name: map['name'],
        description: map['description'],
        brand: map['brand'],
        productCode: map['productCode'],
      );

  String toJson() => json.encode(toMap());

  factory ProductHistoryModel.fromJson(String source) =>
      ProductHistoryModel.fromMap(json.decode(source));
}
