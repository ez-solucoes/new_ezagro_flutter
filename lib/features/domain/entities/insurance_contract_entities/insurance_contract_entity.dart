import 'package:equatable/equatable.dart';

import '../contract_entities/contract_item_entity.dart';

class InsuranceContractEntity extends Equatable {
  final int id;
  final String? contract;
  final String? externalCode;
  final String? startDate;
  final String? endDate;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<ContractItemEntity>? items;

  const InsuranceContractEntity({
    required this.id,
    this.contract,
    this.externalCode,
    this.startDate,
    this.endDate,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.items,
  });

  @override
  List<Object?> get props => [
     id,
    contract,
    externalCode,
    startDate,
    endDate,
    description,
    createdAt,
    updatedAt,
    deletedAt,
    items,
  ];
}
