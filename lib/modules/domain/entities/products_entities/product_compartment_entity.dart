import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/invoice_entities/invoice_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/products_entities/product_entity.dart';

class ProductCompartmentEntity extends Equatable {
  final int id;
  final ProductEntity product;
  final String quantity;
  final String dueDate;
  final List<InvoiceEntity> invoices;

  const ProductCompartmentEntity({
    required this.id,
    required this.product,
    required this.quantity,
    required this.dueDate,
    required this.invoices,
  });

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
        dueDate,
        invoices,
      ];
}
