import 'dart:convert';

import '../../../domain/entities/crop_entities/crop_diversity_entity.dart';
import '../technology_models/technoloty_type_model.dart';

class CropDiversityModel extends CropDiversityEntity {
  const CropDiversityModel({
    required super.id,
    super.name,
    super.technologyType,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'technologyType': (technologyType as TechnologyTypeModel).toMap(),
      };

  factory CropDiversityModel.fromMap(Map<String, dynamic> map) =>
      CropDiversityModel(
        id: map['id'],
        name: map['name'],
        technologyType: map['technologyType'] == null ? null : TechnologyTypeModel.fromMap(map['technologyType']),
      );

  String toJson() => json.encode(toMap());

  factory CropDiversityModel.fromJson(String source) =>
      CropDiversityModel.fromMap(json.decode(source));
}
