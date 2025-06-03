import 'package:equatable/equatable.dart';

import 'measurement_unit_type_entity.dart';

class MeasurementUnitEntity extends Equatable {
  final int id;
  final String name;
  final String? symbol;
  final String slug;
  final bool? isActive;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final MeasurementUnitTypeEntity? type;

  const MeasurementUnitEntity({
    required this.id,
    required this.name,
    this.symbol,
    required this.slug,
    this.isActive,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.type,
});

  @override
  List<Object?> get props => [
    id,
    name,
    symbol,
    slug,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
    type,
  ];
}