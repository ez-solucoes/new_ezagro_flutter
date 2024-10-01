import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_stage_entity.dart';

class PestEntity extends Equatable {
  final int id;
  final String commonName1;
  final String commonName2;
  final String commonName3;
  final String scientificName;
  final List<PestStageEntity> pestStages;
  final String quantityByAreaType;
  final String pestType;

  const PestEntity({
    required this.id,
    required this.commonName1,
    required this.commonName2,
    required this.commonName3,
    required this.scientificName,
    required this.pestStages,
    required this.quantityByAreaType,
    required this.pestType,
  });

  @override
  List<Object?> get props => [
        id,
        commonName1,
        commonName2,
        commonName3,
        scientificName,
        pestStages,
        quantityByAreaType,
        pestType,
      ];
}
