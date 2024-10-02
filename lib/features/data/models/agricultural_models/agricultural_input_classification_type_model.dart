import 'dart:convert';

import '../../../domain/entities/agricultural_entities/agricultural_input_classification_type_entity.dart';

class AgriculturalInputClassificationTypeModel
    extends AgriculturalInputClassificationTypeEntity {
  const AgriculturalInputClassificationTypeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

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

  String toJson() => json.encode(toMap());

  factory AgriculturalInputClassificationTypeModel.fromJson(String source) =>
      AgriculturalInputClassificationTypeModel.fromMap(json.decode(source));
}