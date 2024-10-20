import 'package:equatable/equatable.dart';

import 'contract_entity.dart';

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
