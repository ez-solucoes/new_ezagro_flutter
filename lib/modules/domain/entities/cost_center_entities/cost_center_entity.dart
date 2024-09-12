import 'dart:math';

import 'package:equatable/equatable.dart';

import 'cost_center_type_entity.dart';

class CostCenterEntity extends Equatable {
  final int id;
  final String name;
  final CostCenterTypeEntity costCenterType;
  final String dtStart;
  final String dtEnd;

  const CostCenterEntity(
      {required this.id,
      required this.name,
      required this.costCenterType,
      required this.dtStart,
      required this.dtEnd});

  @override
  List<Object?> get props => [
        id,
        name,
        costCenterType,
        dtStart,
        dtEnd,
      ];
}
