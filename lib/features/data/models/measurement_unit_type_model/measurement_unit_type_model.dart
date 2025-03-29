import 'dart:convert';

import '../../../domain/entities/measurement_unit_entities/measurement_unit_type_entity.dart';

class MeasurementUnitTypeModel extends MeasurementUnitTypeEntity {
  const MeasurementUnitTypeModel({
    required super.id,
    required super.name,
    required super.isActive,
    required super.createdAt,
    required super.slug,
    super.symbol,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'isActive': isActive,
        'createdAt': createdAt,
        'slug': slug,
        'symbol': symbol,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };

  factory MeasurementUnitTypeModel.fromMap(Map<String, dynamic> map) =>
      MeasurementUnitTypeModel(
        id: map['id'],
        name: map['name'],
        isActive: map['isActive'],
        createdAt: map['createdAt'],
        slug: map['slug'],
        symbol: map['symbol'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
      );

  String toJson() => json.encode(toMap());

  factory MeasurementUnitTypeModel.fromJson(String source) =>
      MeasurementUnitTypeModel.fromMap(json.decode(source));
}
