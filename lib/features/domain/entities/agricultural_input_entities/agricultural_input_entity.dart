import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/measurement_unit_entities/measurement_unit_entity.dart';

class AgriculturalInputEntity extends Equatable {
  final int id;
  final String? trademark;
  final String? registrationHolder;
  final String? activeIngredients;
  final String? toxicityClass;
  final String? environmentalClass;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<ClassEntity>? classes;
  final MeasurementUnitEntity? measurementUnit;

  const AgriculturalInputEntity ({
    required this.id,
    this.trademark,
    this.registrationHolder,
    this.activeIngredients,
    this.toxicityClass,
    this.environmentalClass,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.classes,
    this.measurementUnit,
});

  @override
  List<Object?> get props => [
    id,
    trademark,
    registrationHolder,
    activeIngredients,
    toxicityClass,
    environmentalClass,
    createdAt,
    updatedAt,
    deletedAt,
    classes,
    measurementUnit,
  ];

}