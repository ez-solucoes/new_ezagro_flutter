import 'dart:convert';
import '../../../domain/entities/pest_entities/pest_entity.dart';
import 'pest_stage_model.dart';

class PestModel extends PestEntity {
  const PestModel({
    required super.id,
    required super.commonName1,
    required super.commonName2,
    required super.commonName3,
    required super.scientificName,
    required super.pestStages,
    required super.quantityByAreaType,
    required super.pestType,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'commonName1': commonName1,
    'commonName2': commonName2,
    'commonName3': commonName3,
    'scientificName': scientificName,
    'pestStages':pestStages.map((e) => (e as PestStageModel).toMap()).toList(),
    'quantityByAreaType': quantityByAreaType,
    'pestType': pestType,
  };

  factory PestModel.fromMap(Map<String, dynamic> map) => PestModel(
    id: map['id'],
    commonName1: map['commonName1'],
    commonName2: map['commonName2'],
    commonName3: map['commonName3'],
    scientificName: map['scientificName'],
    pestStages: List<PestStageModel>.from(
        map['pestStages']?.map((x) => PestStageModel.fromMap(x))),
    quantityByAreaType: map['quantityByAreaType'],
    pestType: map['pestType'],
  );

  String toJson() => json.encode(toMap());

  factory PestModel.fromJson(String source) =>
      PestModel.fromMap(json.decode(source));

}