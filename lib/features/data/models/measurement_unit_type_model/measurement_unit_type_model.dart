import 'dart:convert';

import '../../../domain/entities/measurement_unit_entities/measurement_unit_type_entity.dart';

class MeasurementUnitTypeModel extends MeasurementUnitTypeEntity {
  const MeasurementUnitTypeModel({
    required super.id,
    required super.name,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'active': active,
      };

  factory MeasurementUnitTypeModel.fromMap(Map<String, dynamic> map) =>
      MeasurementUnitTypeModel(
        id: map['id'],
        name: map['name'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory MeasurementUnitTypeModel.fromJson(String source) =>
      MeasurementUnitTypeModel.fromMap(json.decode(source));
}
