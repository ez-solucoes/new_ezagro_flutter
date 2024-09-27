import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/inventory_entities/inventory_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/machine_implement_entities/machine_implement_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/purchaseOrderEntities/purchase_order_item_entity.dart';

import '../farm_entities/farm_entity.dart';
import '../tax_entities/tax_entity.dart';

class InvoiceItemsEntity extends Equatable{
  final int id;
  final String unitOfMeasure;
  final ProductEntity product;
  final TaxEntity tax;
  final int quantity;
  final MachineImplementEntity machineImplement;
  final InventoryEntity inventory;
  final double discount;
  final double unitPrice;
  final double totalPrice;
  final FarmEntity farm;
  final PurchaseOrderItemEntity purchaseOrderItems;
  
  const InvoiceItemsEntity({
    required this.id,
    required this.unitOfMeasure,
    required this.product,
    required this.tax,
    required this.quantity,
    required this.machineImplement,
    required this.inventory,
    required this.discount,
    required this.unitPrice,
    required this.totalPrice,
    required this.farm,
    required this.purchaseOrderItems,
});


  @override
  List<Object?> get props => [
    id,
    unitOfMeasure,
    product,
    tax,
    quantity,
    machineImplement,
    inventory,
    discount,
    unitPrice,
    totalPrice,
    farm,
    purchaseOrderItems,
  ];
}