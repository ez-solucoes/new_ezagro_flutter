import 'dart:convert';

import '../../../domain/entities/pix_entities/pix_type_entity.dart';

class PixTypeModel extends PixTypeEntity {
  const PixTypeModel({
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

  factory PixTypeModel.fromMap(Map<String, dynamic> map) => PixTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory PixTypeModel.fromJson(String source) =>
      PixTypeModel.fromMap(json.decode(source));
}
