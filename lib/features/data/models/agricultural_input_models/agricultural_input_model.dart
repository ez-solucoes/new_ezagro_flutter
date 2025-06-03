import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import '../class_models/class_model.dart';
import '../measurement_unit_type_model/measurement_unit_model.dart';

class AgriculturalInputModel extends AgriculturalInputEntity {
  const AgriculturalInputModel({
    required super.id,
    super.trademark,
    super.registrationHolder,
    super.activeIngredients,
    super.toxicityClass,
    super.environmentalClass,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.classes,
    super.measurementUnit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'trademark': trademark,
      'registrationHolder': registrationHolder,
      'activeIngredients': activeIngredients,
      'toxicityClass': toxicityClass,
      'environmentalClass': environmentalClass,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'classes': classes,
      'measurementUnit': measurementUnit,
    };
  }

  factory AgriculturalInputModel.fromMap(Map<String, dynamic> map) {
    return AgriculturalInputModel(
      id: map['id'] as int,
      trademark: map['trademark'] as String,
      registrationHolder: map['registrationHolder'] as String,
      activeIngredients: map['activeIngredients'] as String,
      toxicityClass: map['toxicityClass'] as String,
      environmentalClass: map['environmentalClass'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      classes: map['classes'] == null
          ? null
          : (map['classes'] as List<dynamic>)
              .map((item) => ClassModel.fromMap(item))
              .toList(),
      measurementUnit: map['measurementUnit'] == null
          ? null
          : MeasurementUnitModel.fromMap(map['measurementUnit'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AgriculturalInputModel.fromJson(String source) =>
      AgriculturalInputModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
