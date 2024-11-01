import 'dart:convert';

import '../../../domain/entities/field_service_order_entities/field_service_order_type_entity.dart';

class FieldServiceOrderTypeModel extends FieldServiceOrderTypeEntity {
  const FieldServiceOrderTypeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

  String toJson() => json.encode(toMap());

  factory FieldServiceOrderTypeModel.fromJson(String source) =>
      FieldServiceOrderTypeModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'active': active,
      };

  factory FieldServiceOrderTypeModel.fromMap(Map<String, dynamic> map) =>
      FieldServiceOrderTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );
}
