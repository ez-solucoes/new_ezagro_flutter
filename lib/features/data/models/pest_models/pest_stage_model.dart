import 'dart:convert';

import '../../../domain/entities/pest_entities/pest_stage_entity.dart';
import '../development_cycle_models/development_cycle_model.dart';

class PestStageModel extends PestStageEntity {
  const PestStageModel({
    required super.id,
    required super.description,
    required super.time,
    required super.unitOfDays,
    required super.infestationLevel,
    required super.minimumInfestationLevel,
    required super.measurementQuantityOfLeaves,
    required super.developmentCycle,
    required super.name,
    required super.quantityByAreaType,
    required super.pestUnitOfTime,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'description': description,
        'time': time,
        'unitOfDays': unitOfDays,
        'infestationLevel': infestationLevel,
        'minimumInfestationLevel': minimumInfestationLevel,
        'measurementQuantityOfLeaves': measurementQuantityOfLeaves,
        'developmentCycle': (developmentCycle as DevelopmentCycleModel).toMap(),
        'name': name,
        'quantityByAreaType': quantityByAreaType,
        'pestUnitOfTime': pestUnitOfTime,
      };

  factory PestStageModel.fromMap(Map<String, dynamic> map) => PestStageModel(
        id: map['id'],
        description: map['description'],
        time: map['time'],
        unitOfDays: map['unitOfDays'],
        infestationLevel: map['infestationLevel'],
        minimumInfestationLevel: map['minimumInfestationLevel'],
        measurementQuantityOfLeaves: map['measurementQuantityOfLeaves'],
        developmentCycle:
            DevelopmentCycleModel.fromMap(map['developmentCycle']),
        name: map['name'],
        quantityByAreaType: map['quantityByAreaType'],
        pestUnitOfTime: map['pestUnitOfTime'],
      );

  String toJson() => json.encode(toMap());

  factory PestStageModel.fromJson(String source) =>
      PestStageModel.fromMap(json.decode(source));
}
