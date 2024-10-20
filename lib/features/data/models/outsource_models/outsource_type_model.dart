import 'dart:convert';

import '../../../domain/entities/outsource_entities/outsource_type_entity.dart';

class OutsourceTypeModel extends OutsourceTypeEntity {
  const OutsourceTypeModel({
    required super.id,
    required super.name,
  });

  String toJson() => json.encode(toMap());

  factory OutsourceTypeModel.fromJson(String source) =>
      OutsourceTypeModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory OutsourceTypeModel.fromMap(Map<String, dynamic> map) =>
      OutsourceTypeModel(
        id: map['id'],
        name: map['name'],
      );
}
