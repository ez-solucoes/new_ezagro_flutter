import 'package:equatable/equatable.dart';

import 'cost_center_type_entity.dart';

class CostCenterEntity extends Equatable {
  final int id;
  final String? costCenterName;
  final CostCenterTypeEntity? costCenterType;
  final String? dtStart;
  final String? dtEnd;

  const CostCenterEntity(
      {
        required this.id,
      this.costCenterName,
      this.costCenterType,
      this.dtStart,
      this.dtEnd});

  @override
  List<Object?> get props => [
        id,
        costCenterName,
        costCenterType,
        dtStart,
        dtEnd,
      ];
}
