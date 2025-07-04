import 'dart:convert';

import '../../../domain/entities/crop_entities/crop_variety_entity.dart';
import '../type_models/type_model.dart';
import 'crop_model.dart';

class CropVarietyModel extends CropVarietyEntity {
  const CropVarietyModel({
    required super.id,
    super.name,
    super.isConventionalTechnology,
    super.technologyName,
    super.productionCycleDays,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.crop,
    super.productionCycle,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'isConventionalTechnology': isConventionalTechnology,
    'technologyName': technologyName,
    'productionCycleDays': productionCycleDays,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'crop': (crop as CropModel).toMap(),
    'productionCycle': (productionCycle as TypeModel).toMap(),
  };

  factory CropVarietyModel.fromMap(Map<String, dynamic> map) => CropVarietyModel(
    id: map['id'],
    name: map['name'],
    isConventionalTechnology: map['isConventionalTechnology'],
    technologyName: map['technologyName'],
    productionCycleDays: map['productionCycleDays'],
    createdAt: map['createdAt'],
    updatedAt: map['updatedAt'],
    deletedAt: map['deletedAt'],
    crop: map['crop'] == null ? null : CropModel.fromMap(map['crop']),
    productionCycle: map['productionCycle'] == null ? null : TypeModel.fromMap(map['productionCycle']),
  );

  String toJson() => json.encode(toMap());

  factory CropVarietyModel.fromJson(String source) => CropVarietyModel.fromMap(json.decode(source));


}