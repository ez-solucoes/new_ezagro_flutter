import 'package:equatable/equatable.dart';

import '../products_entities/product_compartment_entity.dart';

class CompartmentHistoryEntity extends Equatable {
  final int id;
  final int code;
  final List<ProductCompartmentEntity> products;

  const CompartmentHistoryEntity(
      {required this.id, required this.code, required this.products});

  @override
  List<Object?> get props => [
        id,
        code,
        products,
      ];
}
