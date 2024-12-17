
import 'package:equatable/equatable.dart';

import '../company_entities/company_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../farm_entities/farm_entity.dart';
import '../rural_producer_entities/rural_producer_entity.dart';
import 'contract_item_entity.dart';
import 'contract_type_entity.dart';

class ContractEntity extends Equatable {
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
  final List<CostCenterEntity>? costCenters;
  final ContractTypeEntity? contractType;
  final RuralProducerEntity? ruralProducer;
  final FarmEntity? farm;
  final CompanyEntity? ownCompany;
  final CompanyEntity? creditorCompany;
  final CompanyEntity? debtorCompany;

  const ContractEntity({
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
    this.costCenters,
    this.contractType,
    this.ruralProducer,
    this.farm,
    this.ownCompany,
    this.creditorCompany,
    this.debtorCompany,
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
    costCenters,
    contractType,
    ruralProducer,
    farm,
    ownCompany,
    creditorCompany,
    debtorCompany,
  ];
}