import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';

import '../../../domain/entities/products_entities/product_usage_recommendation_entity.dart';
import '../agricultural_input_models/agricultural_input_model.dart';
import '../stock_models/stock_model.dart';

class ProductUsageRecommendationModel extends ProductUsageRecommendationEntity {
  const ProductUsageRecommendationModel({
    required super.id,
    super.quantity,
    super.recommendation,
    super.recommendationPerHectare,
    super.totalUsage,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.product,
    super.agriculturalInput,
    super.originStock,
    super.destinationStock,
  });

  String toJson() => json.encode(toMap());

  factory ProductUsageRecommendationModel.fromJson(String source) =>
      ProductUsageRecommendationModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'quantity': quantity,
        'recommendation': recommendation,
        'recommendationPerHectare': recommendationPerHectare,
        'totalUsage': totalUsage,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'product': product,
        'agriculturalInput': agriculturalInput,
        'originStock': originStock,
        'destinationStock': destinationStock,
      };

  factory ProductUsageRecommendationModel.fromMap(Map<String, dynamic> map) =>
      ProductUsageRecommendationModel(
        id: map['id'],
        quantity: map['quantity'],
        recommendation: map['recommendation'],
        recommendationPerHectare: map['recommendationPerHectare'],
        totalUsage: map['totalUsage'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
        product:map['product'] == null ? null : ProductModel.fromMap(map['product']),
        agriculturalInput: map['agriculturalInput'] == null ? null : AgriculturalInputModel.fromMap(map['agriculturalInput']),
        originStock: map['originStock'] == null ? null : StockModel.fromMap(map['originStock']),
        destinationStock: map['destinationStock'] == null ? null : StockModel.fromMap(map['destinationStock']),
      );

}
