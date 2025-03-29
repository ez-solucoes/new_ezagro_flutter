import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/harvest_entities/harvest_cost_center_entity.dart';

import '../crop_entities/crop_variety_entity.dart';
import '../soil_stage_entities/soil_stage_entity.dart';

class FarmPlotEntity extends Equatable {
  final int id;
  final String? number;
  final String? area;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CropVarietyEntity? cropVariety;
  final SoilStageEntity? plotSoilStage;
  final List<HarvestCostCenterEntity>? harvestCostCenters;

  const FarmPlotEntity({
    required this.id,
    this.number,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.cropVariety,
    this.plotSoilStage,
    this.harvestCostCenters,
});

  @override
  List<Object?> get props => [
    id,
    number,
    area,
    createdAt,
    updatedAt,
    deletedAt,
    cropVariety,
    plotSoilStage,
    harvestCostCenters,
  ];
}