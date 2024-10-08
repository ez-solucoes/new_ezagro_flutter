import 'dart:convert';

import '../../../domain/entities/cost_center_entities/cost_center_type_entity.dart';

class CostCenterTypeModel extends CostCenterTypeEntity {
  const CostCenterTypeModel({
    required super.id,
    required super.name,
    required super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory CostCenterTypeModel.fromMap(Map<String, dynamic> map) =>
      CostCenterTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory CostCenterTypeModel.fromJson(String source) =>
      CostCenterTypeModel.fromMap(json.decode(source));
}
