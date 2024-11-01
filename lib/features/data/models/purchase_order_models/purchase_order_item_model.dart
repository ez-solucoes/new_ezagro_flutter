import 'dart:convert';

import '../../../domain/entities/purchase_order_entities/purchase_order_item_entity.dart';
import '../products_models/product_model.dart';

class PurchaseOrderItemModel extends PurchaseOrderItemEntity {
  const PurchaseOrderItemModel({
    required super.id,
    required super.product,
    required super.quantity,
    required super.brand,
    required super.observation,
    required super.unitPrice,
    required super.totalPrice,
    required super.unit,
  });

  String toJson() => json.encode(toMap());

  factory PurchaseOrderItemModel.fromJson(String source) =>
      PurchaseOrderItemModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'product': (product as ProductModel).toMap(),
        'quantity': quantity,
        'brand': brand,
        'observation': observation,
        'unitPrice': unitPrice,
        'totalPrice': totalPrice,
        'unit': unit,
      };

  factory PurchaseOrderItemModel.fromMap(Map<String, dynamic> map) =>
      PurchaseOrderItemModel(
        id: map['id'],
        product: ProductModel.fromMap(map['product']),
        quantity: map['quantity'],
        brand: map['brand'],
        observation: map['observation'],
        unitPrice: map['unitPrice'],
        totalPrice: map['totalPrice'],
        unit: map['unit'],
      );
}
