import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/measurement_unit_entities/measurement_unit_type_entity.dart';

import '../type_entities/type_entity.dart';

class SuggestedProductEntity extends Equatable {
  final int id;
  final String? trademark;
  final String? description;
  final String? registrationHolder;
  final String? imageUrl;
  final String? slug;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final TypeEntity? type;
  final MeasurementUnitTypeEntity? measurementUnit;

  const SuggestedProductEntity({
    required this.id,
    this.trademark,
    this.description,
    this.registrationHolder,
    this.imageUrl,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.type,
    this.measurementUnit,
});


  @override
  List<Object?> get props => [
        id,
        trademark,
        description,
        registrationHolder,
        imageUrl,
        slug,
        isActive,
        createdAt,
        updatedAt,
        deletedAt,
        type,
        measurementUnit,
  ];
}