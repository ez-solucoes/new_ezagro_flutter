import 'dart:convert';

import '../../../domain/entities/cost_center_entities/cost_center_history_entity.dart';
import 'cost_center_type_model.dart';

class CostCenterHistoryModel extends CostCenterHistoryEntity {
  const CostCenterHistoryModel({
    required super.costCenterHistoryId,
    required super.costCenterId,
    required super.costCenterName,
    required super.costCenterType,
    required super.dtStart,
    required super.dtEnd,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
        'costCenterHistoryId': costCenterHistoryId,
        'costCenterId': costCenterId,
        'costCenterName': costCenterName,
        'costCenterType': (costCenterType as CostCenterTypeModel).toMap(),
        'dtStart': dtStart,
        'dtEnd': dtEnd,
        'active': active,
      };

  factory CostCenterHistoryModel.fromMap(Map<String, dynamic> map) =>
      CostCenterHistoryModel(
        costCenterHistoryId: map['costCenterHistoryId'],
        costCenterId: map['costCenterId'],
        costCenterName: map['costCenterName'],
        costCenterType: CostCenterTypeModel.fromMap(map['costCenterType']),
        dtStart: map['dtStart'],
        dtEnd: map['dtEnd'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory CostCenterHistoryModel.fromJson(String source) =>
      CostCenterHistoryModel.fromMap(json.decode(source));
}
