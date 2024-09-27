import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/development_cycle_entities/development_cycle_entity.dart';

class PestStageEntity extends Equatable {
  final int id;
  final String description;
  final double time;
  final String unitOfDays;
  final String infestationLevel;
  final double minimumInfestationLevel;
  final String measurementQuantityOfLeaves;
  final DevelopmentCycleEntity developmentCycle;
  final String name;
  final String quantityByAreaType;
  final String pestUnitOfTime;

  const PestStageEntity({
    required this.id,
    required this.description,
    required this.time,
    required this.unitOfDays,
    required this.infestationLevel,
    required this.minimumInfestationLevel,
    required this.measurementQuantityOfLeaves,
    required this.developmentCycle,
    required this.name,
    required this.quantityByAreaType,
    required this.pestUnitOfTime,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        time,
        unitOfDays,
        infestationLevel,
        minimumInfestationLevel,
        measurementQuantityOfLeaves,
        developmentCycle,
        name,
        quantityByAreaType,
        pestUnitOfTime
      ];
}
