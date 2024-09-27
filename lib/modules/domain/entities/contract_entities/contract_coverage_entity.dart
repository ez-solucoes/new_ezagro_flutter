import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/contract_entities/contract_entity.dart';

class ContractCoverageEntity extends Equatable {
  final int id;
  final String description;
  final ContractEntity contract;

  const ContractCoverageEntity({
    required this.id,
    required this.description,
    required this.contract,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        contract,
      ];
}
