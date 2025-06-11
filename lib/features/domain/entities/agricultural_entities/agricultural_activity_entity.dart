import 'package:equatable/equatable.dart';

import '../type_entities/type_entity.dart';
import 'agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';

class AgriculturalActivityEntity extends Equatable {
  final int id;
  final String? activityName;
  final String? description;
  final bool? needsApproval;
  final bool? isDefault;
  final TypeEntity? activityType;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<AgriculturalSubActivityEntity>? subActivities;

  const AgriculturalActivityEntity({
    required this.id,
    this.activityName,
    this.description,
    this.needsApproval,
    this.isDefault,
    this.activityType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.subActivities,
  });

  @override
  List<Object?> get props => [
        id,
        activityName,
        description,
        needsApproval,
        isDefault,
        activityType,
        createdAt,
        updatedAt,
        deletedAt,
        subActivities,
      ];
}
