
import 'dart:convert';

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
        activityType: map['activityType'],
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