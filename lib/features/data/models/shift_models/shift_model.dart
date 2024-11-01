import 'dart:convert';

import '../../../domain/entities/shift_entity/shift_entity.dart';

class ShiftModel extends ShiftEntity {
  const ShiftModel({
    required super.id,
    required super.name,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'active': active,
      };

  factory ShiftModel.fromMap(Map<String, dynamic> map) => ShiftModel(
        id: map['id'],
        name: map['name'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory ShiftModel.fromJson(String source) =>
      ShiftModel.fromMap(json.decode(source));
}
