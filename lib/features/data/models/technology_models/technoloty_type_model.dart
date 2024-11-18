import 'dart:convert';

import '../../../domain/entities/technology_entities/technology_type_entity.dart';

class TechnologyTypeModel extends TechnologyTypeEntity {
  const TechnologyTypeModel({
    required super.id,
    required super.name,
    required super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory TechnologyTypeModel.fromMap(Map<String, dynamic> map) =>
      TechnologyTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory TechnologyTypeModel.fromJson(String source) =>
      TechnologyTypeModel.fromMap(json.decode(source));
}
