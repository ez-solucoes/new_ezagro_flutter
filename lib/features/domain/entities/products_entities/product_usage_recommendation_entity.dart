import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_history_entity.dart';

class ProductUsageRecommendationEntity extends Equatable {
  final int id;
  final ProductHistoryEntity product;
  final double recommendedQuantity;
  final double usageTotal;
  final double recommendationPerHectare;
  final int quantity;

  const ProductUsageRecommendationEntity({
    required this.id,
    required this.product,
    required this.recommendedQuantity,
    required this.usageTotal,
    required this.recommendationPerHectare,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        product,
        recommendedQuantity,
        usageTotal,
        recommendationPerHectare,
        quantity,
      ];
}
