import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

class AgriculturalInputEntity extends Equatable {
  final int id;
  final String? trademark;
  final String? registrationHolder;
  final String? activeIngredients;
  final String? toxicityClass;
  final String? ambientalClass;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final ClassEntity? classEntity;

  const AgriculturalInputEntity ({
    required this.id,
    this.trademark,
    this.registrationHolder,
    this.activeIngredients,
    this.toxicityClass,
    this.ambientalClass,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.classEntity,
});

  @override
  List<Object?> get props => [
    id,
    trademark,
    registrationHolder,
    activeIngredients,
    toxicityClass,
    ambientalClass,
    createdAt,
    updatedAt,
    deletedAt,
    classEntity,
  ];

}