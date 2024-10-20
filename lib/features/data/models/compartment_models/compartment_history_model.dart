import 'dart:convert';

import '../../../domain/entities/compartment_entities/compartment_history_entity.dart';
import '../products_models/product_compartment_model.dart';

class CompartmentHistoryModel extends CompartmentHistoryEntity {
  const CompartmentHistoryModel({
    required super.id,
    required super.code,
    required super.products,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'code': code,
        'products': products
            .map((e) => (e as ProductCompartmentModel).toMap())
            .toList(),
      };

  factory CompartmentHistoryModel.fromMap(Map<String, dynamic> map) =>
      CompartmentHistoryModel(
        id: map['id'],
        code: map['code'],
        products: List<ProductCompartmentModel>.from(
            map['products']?.map((x) => ProductCompartmentModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory CompartmentHistoryModel.fromJson(String source) =>
      CompartmentHistoryModel.fromMap(json.decode(source));
}
