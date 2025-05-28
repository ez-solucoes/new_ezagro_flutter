import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import 'crop_entity.dart';

class CropVarietyEntity extends Equatable {
  final int id;
  final String? name;
  final bool? isConventionalTechnology;
  final String? technologyName;
  final int? productionCycleDays;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CropEntity? crop;
  final TypeEntity? productionCycle;

  const CropVarietyEntity({
    required this.id,
    this.name,
    this.isConventionalTechnology,
    this.technologyName,
    this.productionCycleDays,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.crop,
    this.productionCycle,
});

  @override
  List<Object?> get props => [
    id,
    name,
    isConventionalTechnology,
    technologyName,
    productionCycleDays,
    createdAt,
    updatedAt,
    deletedAt,
    crop,
    productionCycle,
  ];
}
