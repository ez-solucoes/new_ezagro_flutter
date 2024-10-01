
import '../../../domain/entities/cost_center_entities/cost_center_type_entity.dart';

class CostCenterTypeModel extends CostCenterTypeEntity {const CostCenterTypeModel({
  required super.id,
  required super.name,
  required super.description,
});

factory CostCenterTypeModel.fromJson(Map<String, dynamic> json) =>
    CostCenterTypeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );

Map<String, dynamic> toJson() => {
  'id': id,
  'name': name,
  'description': description,
};

Map<String, dynamic> toMap() => {
  'id': id,
  'name': name,
  'description': description,
};

factory CostCenterTypeModel.fromMap(Map<String, dynamic> map) =>
    CostCenterTypeModel(
      id: map['id'],name: map['name'],
      description: map['description'],
    );
}