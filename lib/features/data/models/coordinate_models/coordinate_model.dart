import 'dart:convert';

import '../../../domain/entities/coordinate_entities/coordinate_entity.dart';

class CoordinateModel extends CoordinateEntity {
  const CoordinateModel({
    required super.id,
    required super.longitude,
    required super.latitude,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'longitude': longitude,
    'latitude': latitude,
  };

  factory CoordinateModel.fromMap(Map<String, dynamic> map) => CoordinateModel(
    id: map['id'],
    longitude: map['longitude'],
    latitude: map['latitude'],
  );

  String toJson() => json.encode(toMap());

  factory CoordinateModel.fromJson(String source) =>
      CoordinateModel.fromMap(json.decode(source));
}