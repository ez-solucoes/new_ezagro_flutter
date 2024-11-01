import 'dart:convert';

import '../../../domain/entities/crop_entities/crop_diversity_history_entity.dart';
import '../technology_models/technoloty_type_model.dart';
import 'crop_model.dart';

class CropDiversityHistoryModel extends CropDiversityHistoryEntity {
  const CropDiversityHistoryModel({
    super.cropDiversityHistoryId,
    super.cropDiversityId,
    super.name,
    super.crop,
    super.technologyType,
    super.plantingType,
    super.plantingCycle,
    super.plantingCycleDays,
  });

  Map<String, dynamic> toMap() => {
        'cropDiversityHistoryId': cropDiversityHistoryId,
        'cropDiversityId': cropDiversityId,
        'name': name,
        'crop': (crop as CropModel).toMap(),
        'technologyType': (technologyType as TechnologyTypeModel).toMap(),
        'plantingType': plantingType,
        'plantingCycle': plantingCycle,
        'plantingCycleDays': plantingCycleDays,
      };

  factory CropDiversityHistoryModel.fromMap(Map<String, dynamic> map) =>
      CropDiversityHistoryModel(
        cropDiversityHistoryId: map['cropDiversityHistoryId'],
        cropDiversityId: map['cropDiversityId'],
        name: map['name'],
        crop: map['crop'] == null ? null : CropModel.fromMap(map['crop']),
        technologyType: map['technologyType'] == null ? null : TechnologyTypeModel.fromMap(map['technologyType']),
        plantingType: map['plantingType'],
        plantingCycle: map['plantingCycle'],
        plantingCycleDays: map['plantingCycleDays'],
      );

  String toJson() => json.encode(toMap());

  factory CropDiversityHistoryModel.fromJson(String source) =>
      CropDiversityHistoryModel.fromMap(json.decode(source));
}
