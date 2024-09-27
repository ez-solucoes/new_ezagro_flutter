import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/products_entities/product_entity.dart';

class PurchaseOrderItemEntity extends Equatable {
  final int id;
  final ProductEntity product;
  final double quantity;
  final String brand;
  final String observation;
  final double unitPrice;
  final double totalPrice;
  final String unit;

  const PurchaseOrderItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
    required this.brand,
    required this.observation,
    required this.unitPrice,
    required this.totalPrice,
    required this.unit,
  });

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
        brand,
        observation,
        unitPrice,
        totalPrice,
        unit,
      ];
}
