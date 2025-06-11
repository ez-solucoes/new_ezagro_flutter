import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/measurement_unit_entities/measurement_unit_entity.dart';

import 'measurement_unit_type_model.dart';

class MeasurementUnitModel extends MeasurementUnitEntity {
  const MeasurementUnitModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.isActive,
    super.symbol,
    super.type,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'isActive': isActive,
        'symbol': symbol,
        'type': type,
      };

  factory MeasurementUnitModel.fromMap(Map<String, dynamic> map) => MeasurementUnitModel(
        id: map['id'] as int,
        name: map['name'] as String,
        slug: map['slug'] as String,
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String,
        deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
        isActive: map['isActive'] as bool,
        symbol: map['symbol'] as String,
        type: map['type'] == null
            ? null
            : MeasurementUnitTypeModel.fromMap(map['type'] as Map<String, dynamic>),
      );

  String toJson() => json.encode(toMap());

  factory MeasurementUnitModel.fromJson(String source) =>
      MeasurementUnitModel.fromMap(json.decode(source));
}
