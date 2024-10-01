import '../../../domain/entities/coordinate_entities/coordinate_entity.dart';

class CoordinateModel extends CoordinateEntity {
  const CoordinateModel({
    required super.id,
    required super.longitude,
    required super.latitude,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) => CoordinateModel(
    id: json['id'],
    longitude: json['longitude'],
    latitude: json['latitude'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'longitude': longitude,
    'latitude': latitude,
  };

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
}