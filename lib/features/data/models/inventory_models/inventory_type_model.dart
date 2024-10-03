import 'dart:convert';

import '../../../domain/entities/inventory_entities/inventory_type_entity.dart';

class InventoryTypeModel extends InventoryTypeEntity {
  const InventoryTypeModel({
    required super.id,
    required super.name,
    required super.description,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
  };

  factory InventoryTypeModel.fromMap(Map<String, dynamic> map) =>
      InventoryTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory InventoryTypeModel.fromJson(String source) =>
      InventoryTypeModel.fromMap(json.decode(source));

}