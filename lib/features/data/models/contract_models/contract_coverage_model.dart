import 'dart:convert';
import '../../../domain/entities/contract_entities/contract_coverage_entity.dart';
import 'contract_model.dart';

class ContractCoverageModel extends ContractCoverageEntity {
  const ContractCoverageModel({
    required super.id,
    required super.description,
    required super.contract,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'contract': (contract as ContractModel).toMap(),
  };

  factory ContractCoverageModel.fromMap(Map<String, dynamic> map) =>
      ContractCoverageModel(
        id: map['id'],
        description: map['description'],
        contract: ContractModel.fromMap(map['contract']),
      );

  String toJson() => json.encode(toMap());

  factory ContractCoverageModel.fromJson(String source) =>
      ContractCoverageModel.fromMap(json.decode(source));
}