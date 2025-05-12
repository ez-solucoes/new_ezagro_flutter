import 'dart:convert';

import '../../../domain/entities/machinery_implement_entities/machinery_implement_type_entity.dart';

class MachineryImplementTypeModel extends MachineryImplementTypeEntity {
  const MachineryImplementTypeModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.isMachineryType,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'isMachineryType': isMachineryType,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };

  factory MachineryImplementTypeModel.fromMap(Map<String, dynamic> map) =>
      MachineryImplementTypeModel(
        id: map['id'],
        name: map['name'],
        slug: map['slug'],
        isMachineryType: map['isMachineryType'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
      );

  String toJson() => json.encode(toMap());

  factory MachineryImplementTypeModel.fromJson(String source) =>
      MachineryImplementTypeModel.fromMap(json.decode(source));
}
