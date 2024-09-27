import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_type_entity.dart';

class CostCenterHistoryEntity extends Equatable {
  final int costCenterHistoryId;
  final int costCenterId;
  final String costCenterName;
  final CostCenterTypeEntity costCenterType;
  final String dtStart;
  final String dtEnd;
  final bool active;

  const CostCenterHistoryEntity({
    required this.costCenterHistoryId,
    required this.costCenterId,
    required this.costCenterName,
    required this.costCenterType,
    required this.dtStart,
    required this.dtEnd,
    required this.active,
  });

  @override
  List<Object?> get props => [
        costCenterHistoryId,
        costCenterId,
        costCenterName,
        costCenterType,
        dtStart,
        dtEnd,
        active,
      ];
}
