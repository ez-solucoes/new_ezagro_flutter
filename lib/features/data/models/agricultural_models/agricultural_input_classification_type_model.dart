import '../../../domain/entities/agricultural_entities/agricultural_input_classification_type_entity.dart';

class AgriculturalInputClassificationTypeModel
    extends AgriculturalInputClassificationTypeEntity {
  const AgriculturalInputClassificationTypeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

  factory AgriculturalInputClassificationTypeModel.fromJson(
      Map<String, dynamic>json) =>
      AgriculturalInputClassificationTypeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        active: json['active'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'active': active,
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'active':active,
  };

  factory AgriculturalInputClassificationTypeModel.fromMap(
      Map<String, dynamic> map) =>
      AgriculturalInputClassificationTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );
}