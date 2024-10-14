import 'dart:convert';
import '../../../domain/entities/products_entities/product_type_entity.dart';


class ProductTypeModel extends ProductTypeEntity {
  const ProductTypeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'active': active,
  };

  factory ProductTypeModel.fromMap(Map<String, dynamic> map) =>
      ProductTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory ProductTypeModel.fromJson(String source)=>
      ProductTypeModel.fromMap(json.decode(source));

}