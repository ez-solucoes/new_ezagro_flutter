import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';

import '../crop_models/crop_variety_model.dart';

class FarmPlotModel extends FarmPlotEntity {
  const FarmPlotModel({
    required super.id,
    super.number,
    super.area,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.cropVariety,
    super.plotSoilStage,
    super.harvestCostCenters,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'area': area,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'cropVariety': cropVariety == null ? null : (cropVariety as CropVarietyModel).toMap(),
      };

  factory FarmPlotModel.fromMap(Map<String, dynamic> map) => FarmPlotModel(
        id: map['id'] as int,
        number: map['number'] as String?,
        area: map['area'] as String?,
        createdAt: map['createdAt'] as String?,
        updatedAt: map['updatedAt'] as String?,
        deletedAt: map['deletedAt'] as String?,
        cropVariety: map['cropVariety'] != null
            ? CropVarietyModel.fromMap(map['cropVariety'] as Map<String, dynamic>)
            : null,
      );

  String toJson() => json.encode(toMap());

  factory FarmPlotModel.fromJson(String source) =>
      FarmPlotModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
