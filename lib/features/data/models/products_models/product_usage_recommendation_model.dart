import 'dart:convert';
import '../../../domain/entities/products_entities/product_usage_recommendation_entity.dart';
import 'product_history_model.dart';

class ProductUsageRecommendationModel extends ProductUsageRecommendationEntity {
  const ProductUsageRecommendationModel({
    required super.id,
    required super.product,
    required super.recommendedQuantity,
    required super.usageTotal,
    required super.recommendationPerHectare,
    required super.quantity,
  });

  String toJson() => json.encode(toMap());

  factory ProductUsageRecommendationModel.fromJson(String source) =>
      ProductUsageRecommendationModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'product': (product as ProductHistoryModel).toMap(),
    'recommendedQuantity': recommendedQuantity,
    'usageTotal': usageTotal,
    'recommendationPerHectare': recommendationPerHectare,
    'quantity': quantity,
  };factory ProductUsageRecommendationModel.fromMap(Map<String, dynamic> map) =>
      ProductUsageRecommendationModel(
        id: map['id'],
        product: ProductHistoryModel.fromMap(map['product']),
        recommendedQuantity: map['recommendedQuantity'],
        usageTotal: map['usageTotal'],
        recommendationPerHectare: map['recommendationPerHectare'],
        quantity: map['quantity'],
      );
}