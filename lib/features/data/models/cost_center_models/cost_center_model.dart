import 'dart:convert';
import '../../../domain/entities/cost_center_entities/cost_center_entity.dart';
import 'cost_center_type_model.dart';

class CostCenterModel extends CostCenterEntity {
  const CostCenterModel({
    required super.id,
    super.name,
    super.startDate,
    super.endDate,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.type,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'startDate': startDate,
    'endDate': endDate,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'type': type == null ? null : (type as CostCenterTypeModel).toMap(),
  };

  factory CostCenterModel.fromMap(Map<String, dynamic> map) => CostCenterModel(
    id: map['id'] as int,
    name: map['name'] as String?,
    startDate: map['startDate'] as String?,
    endDate: map['endDate'] as String?,
    createdAt: map['createdAt'] as String?,
    updatedAt: map['updatedAt'] as String?,
    deletedAt: map['deletedAt'] as String?,
    type: map['type'] != null
        ? CostCenterTypeModel.fromMap(map['type'] as Map<String, dynamic>)
        : null,
  );

  String toJson() => json.encode(toMap());

  factory CostCenterModel.fromJson(String source) =>
      CostCenterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}