// ignore_for_file: unused_import

import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_history_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';

class ProductUsageRecommendationEntity extends Equatable {
  final int id;
  final String? quantity;
  final String? recommendation;
  final String? recommendationPerHectare;
  final String? totalUsage;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final ProductEntity? product;
  final AgriculturalInputEntity? agriculturalInput;
  final StockEntity? originStock;
  final StockEntity? destinationStock;


  const ProductUsageRecommendationEntity({
    required this.id,
    this.quantity,
    this.recommendation,
    this.recommendationPerHectare,
    this.totalUsage,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.product,
    this.agriculturalInput,
    this.originStock,
    this.destinationStock,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
        recommendation,
        recommendationPerHectare,
        totalUsage,
        createdAt,
        updatedAt,
        deletedAt,
        product,
        agriculturalInput,
        originStock,
        destinationStock,
      ];
}
