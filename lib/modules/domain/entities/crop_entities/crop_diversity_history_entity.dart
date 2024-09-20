import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/technology_entities/technology_type_entity.dart';

class CropDiversityHistoryEntity extends Equatable {
  final int cropDiversityHistoryId;
  final int cropDiversityId;
  final String name;
  final CropEntity crop;
  final TechnologyTypeEntity technologyType;
  final String plantingType;
  final String plantingCycle;
  final double plantingCycleDays;

  const CropDiversityHistoryEntity({
    required this.cropDiversityHistoryId,
    required this.cropDiversityId,
    required this.name,
    required this.crop,
    required this.technologyType,
    required this.plantingType,
    required this.plantingCycle,
    required this.plantingCycleDays,
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
