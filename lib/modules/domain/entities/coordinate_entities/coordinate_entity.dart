import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  final int id;
  final double longitude;
  final double latitude;

  const CoordinateEntity(
      {required this.id, required this.longitude, required this.latitude,})

  @override
  List<Object?> get props =>
      [
        id,
        longitude,
        latitude,
      ];
}