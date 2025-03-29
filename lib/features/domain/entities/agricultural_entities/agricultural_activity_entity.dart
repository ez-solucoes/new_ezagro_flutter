import 'package:equatable/equatable.dart';

import '../type_entities/type_entity.dart';

class AgriculturalActivityEntity extends Equatable {
  final int id;
  final String? activityName;
  final String? description;
  final bool? needsApproval;
  final bool? isDefault;
  final TypeEntity? activityType;

  const AgriculturalActivityEntity({
    required this.id,
    this.activityName,
    this.description,
    this.needsApproval,
    this.isDefault,
    this.activityType,
  });

  @override
  List<Object?> get props => [
        id,
        activityName,
        description,
        needsApproval,
        isDefault,
        activityType,
      ];
}
