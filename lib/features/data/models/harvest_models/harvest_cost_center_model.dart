import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/harvest_entities/harvest_cost_center_entity.dart';

import '../cost_center_models/cost_center_model.dart';

class HarvestCostCenterModel extends HarvestCostCenterEntity {
  const HarvestCostCenterModel({
    required super.id,
    super.name,
    super.startDate,
    super.endDate,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.costCenter,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'startDate': startDate,
    'endDate': endDate,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'costCenter': costCenter == null ? null : (costCenter as CostCenterModel).toMap(),
  };

  factory HarvestCostCenterModel.fromMap(Map<String, dynamic> map) => HarvestCostCenterModel(
    id: map['id'] as int,
    name: map['name'] as String?,
    startDate: map['startDate'] as String?,
    endDate: map['endDate'] as String?,
    createdAt: map['createdAt'] as String?,
    updatedAt: map['updatedAt'] as String?,
    deletedAt: map['deletedAt'] as String?,
    costCenter: map['costCenter'] != null
        ? CostCenterModel.fromMap(map['costCenter'] as Map<String, dynamic>)
        : null,
  );

  String toJson() => json.encode(toMap());

  factory HarvestCostCenterModel.fromJson(String source) =>
      HarvestCostCenterModel.fromMap(json.decode(source) as Map<String, dynamic>);

}