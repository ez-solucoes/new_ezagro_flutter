import 'dart:convert';

import '../../../domain/entities/cost_center_entities/cost_center_entity.dart';
import 'cost_center_type_model.dart';

class CostCenterModel extends CostCenterEntity {
  const CostCenterModel({
    required super.id,
    super.name,
    super.costCenterType,
    super.dtStart,
    super.dtEnd,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'costCenterType': (costCenterType as CostCenterTypeModel).toMap(),
        'dtStart': dtStart,
        'dtEnd': dtEnd,
      };

  factory CostCenterModel.fromMap(Map<String, dynamic> map) => CostCenterModel(
        id: map['id'],
        name: map['name'],
        costCenterType: map['costCenterType'] == null ? null : CostCenterTypeModel.fromMap(map['costCenterType']),
        dtStart: map['dtStart'],
        dtEnd: map['dtEnd'],
      );

  String toJson() => json.encode(toMap());

  factory CostCenterModel.fromJson(String source) =>
      CostCenterModel.fromMap(json.decode(source));
}
