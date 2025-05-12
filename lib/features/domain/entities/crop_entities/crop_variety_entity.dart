import 'package:equatable/equatable.dart';

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
  ];
}
