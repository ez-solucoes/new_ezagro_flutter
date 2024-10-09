import 'package:equatable/equatable.dart';

class CoordinateEntity extends Equatable {
  final int id;
  final int? longitude;
  final int? latitude;

  const CoordinateEntity(
      {required this.id, this.longitude, this.latitude,});

  @override
  List<Object?> get props =>
      [
        id,
        longitude,
        latitude,
      ];
}