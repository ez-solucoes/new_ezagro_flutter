import 'dart:convert';

import '../../../domain/entities/crop_entities/crop_diversity_history_entity.dart';
import '../technology_models/technoloty_type_model.dart';
import 'crop_model.dart';

class CropDiversityHistoryModel extends CropDiversityHistoryEntity {
  const CropDiversityHistoryModel({
    required super.cropDiversityHistoryId,
    required super.cropDiversityId,
    required super.name,
    required super.crop,
    required super.technologyType,
    required super.plantingType,
    required super.plantingCycle,
    required super.plantingCycleDays,
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
        crop: CropModel.fromMap(map['crop']),
        technologyType: TechnologyTypeModel.fromMap(map['technologyType']),
        plantingType: map['plantingType'],
        plantingCycle: map['plantingCycle'],
        plantingCycleDays: map['plantingCycleDays'],
      );

  String toJson() => json.encode(toMap());

  factory CropDiversityHistoryModel.fromJson(String source) =>
      CropDiversityHistoryModel.fromMap(json.decode(source));
}
