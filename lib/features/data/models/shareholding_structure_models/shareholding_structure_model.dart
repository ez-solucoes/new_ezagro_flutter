import 'dart:convert';
import '../../../domain/entities/shareholding_structure_entities/shareholding_structure_entity.dart';

class ShareHoldingStructureModel extends ShareHoldingStructureEntity {
  const ShareHoldingStructureModel({
    required super.id,
    super.name,
    super.cpf,
    super.percentage,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'cpf': cpf,
        'percentage': percentage,
      };

  factory ShareHoldingStructureModel.fromMap(Map<String, dynamic> map) =>
      ShareHoldingStructureModel(
        id: map['id'],
        name: map['name'],
        cpf: map['cpf'],
        percentage: map['percentage'],
      );

  String toJson() => json.encode(toMap());

  factory ShareHoldingStructureModel.fromJson(String source) =>
      ShareHoldingStructureModel.fromMap(json.decode(source));
}
