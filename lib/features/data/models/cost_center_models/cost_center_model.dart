import '../../../domain/entities/cost_center_entities/cost_center_entity.dart';
import 'cost_center_type_model.dart';

class CostCenterModel extends CostCenterEntity {
  const CostCenterModel({
    required super.id,
    required super.name,
    required super.costCenterType,
    required super.dtStart,
    required super.dtEnd,
  });

  factory CostCenterModel.fromJson(Map<String, dynamic> json) =>
      CostCenterModel(
        id: json['id'],
        name: json['name'],
        costCenterType: CostCenterTypeModel.fromJson(json['costCenterType']),
        dtStart: json['dtStart'],
        dtEnd: json['dtEnd'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'costCenterType': (costCenterType as CostCenterTypeModel).toJson(),
        'dtStart': dtStart,
        'dtEnd': dtEnd,
      };

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
        costCenterType: CostCenterTypeModel.fromMap(map['costCenterType']),
        dtStart: map['dtStart'],
        dtEnd: map['dtEnd'],
      );
}
