import 'package:equatable/equatable.dart';

class MeasurementUnitTypeEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? symbol;
  final bool isActive;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const MeasurementUnitTypeEntity({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.slug,
    this.symbol,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isActive,
        createdAt,
        slug,
        symbol,
        updatedAt,
        deletedAt,
      ];
}
