import 'package:equatable/equatable.dart';

class AgriculturalActivityEntity extends Equatable {
  final int id;
  final String activityName;
  final String description;
  final bool needsApproval;
  final bool isDefault;
  final String activityType;

  const AgriculturalActivityEntity({
    required this.id,
    required this.activityName,
    required this.description,
    required this.needsApproval,
    required this.isDefault,
    required this.activityType,
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
