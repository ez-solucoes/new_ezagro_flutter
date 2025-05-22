

import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_sub_activity_models/agricultural_sub_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import '../../../domain/entities/agricultural_entities/agricultural_activity_entity.dart';

class AgriculturalActivityModel extends AgriculturalActivityEntity {
  const AgriculturalActivityModel({
    required super.id,
    super.activityName,
    super.description,
    super.needsApproval,
    super.isDefault,
    super.activityType,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.subActivities,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'activityName': activityName,
        'description': description,
        'needsApproval': needsApproval,
        'isDefault': isDefault,
        'activityType': activityType,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'subActivities': subActivities,
      };

  factory AgriculturalActivityModel.fromMap(Map<String, dynamic> map) =>
      AgriculturalActivityModel(
        id: map['id'],
        activityName: map['activityName'],
        description: map['description'],
        needsApproval: map['needsApproval'],
        isDefault: map['isDefault'],
        activityType: TypeModel.fromMap(map['activityType']),
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String,
        deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
        subActivities: map['subActivities'] == null
            ? null
            : List<AgriculturalSubActivityModel>.from(
                map['subActivities']?.map((x) => x)),
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
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        deletedAt: entity.deletedAt,
        subActivities: entity.subActivities,
      );
}
