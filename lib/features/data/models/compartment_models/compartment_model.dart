import 'dart:convert';
import '../../../domain/entities/compartment_entities/compartment_entity.dart';
import '../products_models/product_compartment_model.dart';

class CompartmentModel extends CompartmentEntity {
  const CompartmentModel({
    required super.id,
    required super.code,
    required super.products,
  });

  String toJson() => json.encode(toMap());

  factory CompartmentModel.fromJson(String source) =>
      CompartmentModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'code': code,
    'products':
    products.map((e) => (e as ProductCompartmentModel).toMap()).toList(),
  };

  factory CompartmentModel.fromMap(Map<String, dynamic> map) =>
      CompartmentModel(
        id: map['id'],
        code: map['code'],
        products: List<ProductCompartmentModel>.from(
            map['products']?.map((x) => ProductCompartmentModel.fromMap(x))),
      );
}