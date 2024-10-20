import 'dart:convert';

import '../../../domain/entities/invoice_entities/invoice_items_entity.dart';
import '../farm_models/farm_model.dart';
import '../inventory_models/inventory_model.dart';
import '../machine_implement_models/machine_implement_model.dart';
import '../products_models/product_model.dart';
import '../purchase_order_models/purchase_order_item_model.dart';
import '../tax_models/tax_model.dart';

class InvoiceItemsModel extends InvoiceItemsEntity {
  const InvoiceItemsModel({
    required super.id,
    required super.unitOfMeasure,
    required super.product,
    required super.tax,
    required super.quantity,
    required super.machineImplement,
    required super.inventory,
    required super.discount,
    required super.unitPrice,
    required super.totalPrice,
    required super.farm,
    required super.purchaseOrderItems,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'unitOfMeasure': unitOfMeasure,
        'product': (product as ProductModel).toMap(),
        'tax': (tax as TaxModel).toMap(),
        'quantity': quantity,
        'machineImplement': (machineImplement as MachineImplementModel).toMap(),
        'inventory': (inventory as InventoryModel).toMap(),
        'discount': discount,
        'unitPrice': unitPrice,
        'totalPrice': totalPrice,
        'farm': (farm as FarmModel).toMap(),
        'purchaseOrderItems':
            (purchaseOrderItems as PurchaseOrderItemModel).toMap(),
      };

  factory InvoiceItemsModel.fromMap(Map<String, dynamic> map) =>
      InvoiceItemsModel(
        id: map['id'],
        unitOfMeasure: map['unitOfMeasure'],
        product: ProductModel.fromMap(map['product']),
        tax: TaxModel.fromMap(map['tax']),
        quantity: map['quantity'],
        machineImplement:
            MachineImplementModel.fromMap(map['machineImplement']),
        inventory: InventoryModel.fromMap(map['inventory']),
        discount: map['discount'],
        unitPrice: map['unitPrice'],
        totalPrice: map['totalPrice'],
        farm: FarmModel.fromMap(map['farm']),
        purchaseOrderItems:
            PurchaseOrderItemModel.fromMap(map['purchaseOrderItems']),
      );

  String toJson() => json.encode(toMap());

  factory InvoiceItemsModel.fromJson(String source) =>
      InvoiceItemsModel.fromMap(json.decode(source));
}
