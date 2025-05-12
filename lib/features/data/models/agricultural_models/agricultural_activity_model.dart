// ignore_for_file: unused_import

import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../domain/entities/agricultural_entities/agricultural_activity_entity.dart';

class AgriculturalActivityModel extends AgriculturalActivityEntity {
  const AgriculturalActivityModel({
    required super.id,
    super.activityName,
    super.description,
    super.needsApproval,
    super.isDefault,
    super.activityType,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'activityName': activityName,
        'description': description,
        'needsApproval': needsApproval,
        'isDefault': isDefault,
        'activityType': activityType,
      };

  factory AgriculturalActivityModel.fromMap(Map<String, dynamic> map) =>
      AgriculturalActivityModel(
        id: map['id'],
        activityName: map['activityName'],
        description: map['description'],
        needsApproval: map['needsApproval'],
        isDefault: map['isDefault'],
        activityType: TypeModel.fromMap(map['activityType']),
      );

  String toJson() => json.encode(toMap());

  factory AgriculturalActivityModel.fromJson(String source) =>
      AgriculturalActivityModel.fromMap(json.decode(source));

  factory AgriculturalActivityModel.fromEntity(
          AgriculturalActivityEntity entity) =>
      AgriculturalActivityModel(
        id: entity.id,
        activityName: entity.activityName,
        description: entity.description,
        needsApproval: entity.needsApproval,
        isDefault: entity.isDefault,
        activityType: entity.activityType,
      );
}
