import 'dart:convert';

import '../../../domain/entities/development_cycle_entities/development_cycle_entity.dart';

class DevelopmentCycleModel extends DevelopmentCycleEntity {
  const DevelopmentCycleModel({
    required super.id,
    required super.name,
    required super.description,
    required super.pestType,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'pestType': pestType,
  };

  factory DevelopmentCycleModel.fromMap(Map<String, dynamic> map) =>
      DevelopmentCycleModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        pestType: map['pestType'],
      );

  String toJson() => json.encode(toMap());

  factory DevelopmentCycleModel.fromJson(String source) =>
      DevelopmentCycleModel.fromMap(json.decode(source));
}