import 'package:equatable/equatable.dart';

import '../technology_entities/technology_type_entity.dart';
import 'crop_entity.dart';

class CropDiversityHistoryEntity extends Equatable {
  final int? cropDiversityHistoryId;
  final int? cropDiversityId;
  final String? name;
  final CropEntity? crop;
  final TechnologyTypeEntity? technologyType;
  final String? plantingType;
  final String? plantingCycle;
  final double? plantingCycleDays;

  const CropDiversityHistoryEntity({
    this.cropDiversityHistoryId,
    this.cropDiversityId,
    this.name,
    this.crop,
    this.technologyType,
    this.plantingType,
    this.plantingCycle,
    this.plantingCycleDays,
  });

  @override
  List<Object?> get props => [
        cropDiversityHistoryId,
        cropDiversityId,
        name,
        crop,
        technologyType,
        plantingType,
        plantingCycle,
        plantingCycleDays,
      ];
}
