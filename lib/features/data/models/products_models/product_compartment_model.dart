import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';

import '../../../domain/entities/products_entities/product_compartment_entity.dart';
import '../invoice_models/invoice_model.dart';

class ProductCompartmentModel extends ProductCompartmentEntity {
  const ProductCompartmentModel({
    required super.id,
    required super.product,
    required super.quantity,
    required super.dueDate,
    required super.invoices,
  });

  String toJson() => json.encode(toMap());

  factory ProductCompartmentModel.fromJson(String source) =>
      ProductCompartmentModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'product': (product as ProductModel).toMap(),
        'quantity': quantity,
        'dueDate': dueDate,
        'invoices': invoices.map((e) => (e as InvoiceModel).toMap()).toList(),
      };

  factory ProductCompartmentModel.fromMap(Map<String, dynamic> map) =>
      ProductCompartmentModel(
        id: map['id'],
        product: ProductModel.fromMap(map['product']),
        quantity: map['quantity'],
        dueDate: map['dueDate'],
        invoices: List<InvoiceModel>.from(
            map['invoices']?.map((x) => InvoiceModel.fromMap(x))),
      );
}
