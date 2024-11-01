import 'dart:convert';

import '../../../domain/entities/brand_entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.id,
    super.name,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory BrandModel.fromMap(Map<String, dynamic> map) => BrandModel(
        id: map['id'],
        name: map['name'],
      );

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));
}
