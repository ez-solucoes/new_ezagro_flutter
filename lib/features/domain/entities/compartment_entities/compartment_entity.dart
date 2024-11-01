import 'package:equatable/equatable.dart';

import '../products_entities/product_compartment_entity.dart';

class CompartmentEntity extends Equatable {
  final int id;
  final String code;
  final List<ProductCompartmentEntity> products;

  const CompartmentEntity({
    required this.id,
    required this.code,
    required this.products,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        products,
      ];
}
