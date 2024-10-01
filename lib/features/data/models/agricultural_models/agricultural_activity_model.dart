
import '../../../domain/entities/agricultural_entities/agricultural_activity_entity.dart';

class AgriculturalActivityModel extends AgriculturalActivityEntity {
  const AgriculturalActivityModel({
    required super.id,
    required super.activityName,
    required super.description,
    required super.needsApproval,
    required super.isDefault,
    required super.activityType,
  });

  factory AgriculturalActivityModel.fromJson(Map<String, dynamic> json) =>
      AgriculturalActivityModel(
        id: json['id'],
        activityName: json['activityName'],
        description: json['description'],
        needsApproval: json['needsApproval'],
        isDefault: json['isDefault'],
        activityType: json['activityType'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'activityName': activityName,
    'description': description,
    'needsApproval': needsApproval,
    'isDefault': isDefault,
    'activityType': activityType,};

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
}