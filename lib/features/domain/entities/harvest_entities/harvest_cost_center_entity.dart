import 'package:equatable/equatable.dart';

import '../cost_center_entities/cost_center_entity.dart';

class HarvestCostCenterEntity extends Equatable{
  final int id;
  final String? name;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CostCenterEntity? costCenter;

  const HarvestCostCenterEntity({
    required this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.costCenter,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    startDate,
    endDate,
    createdAt,
    updatedAt,
    deletedAt,
    costCenter,
  ];
}