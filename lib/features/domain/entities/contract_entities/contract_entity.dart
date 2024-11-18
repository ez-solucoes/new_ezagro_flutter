import 'package:equatable/equatable.dart';

import '../company_entities/company_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../farm_entities/farm_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../plot_entities/plot_entity.dart';
import '../rural_producer_entities/rural_producer_entity.dart';
import 'contract_coverage_entity.dart';
import 'contract_item_entity.dart';
import 'contract_type_entity.dart';

class ContractEntity extends Equatable {
  final int id;
  final CompanyEntity? company;
  final CompanyEntity? contractedCompany;
  final RuralProducerEntity? ruralProducer;
  final FarmEntity? farm;
  final String? contract;
  final String? dtContract;
  final String? dtContractEnd;
  final List<MultipartFileCustomEntity>? attachments;
  final String? description;
  final List<CostCenterEntity>? costCenters;
  final List<PlotEntity>? plots;
  final ContractTypeEntity? contractType;
  final List<String>? attachmentNames;
  final String? externalCode;
  final List<ContractCoverageEntity>? contractCoverages;
  final double? deductiblePrice;
  final double? fixedPrice;
  final List<ContractItemEntity>? items;

  const ContractEntity({
    required this.id,
    this.company,
    this.contractedCompany,
    this.ruralProducer,
    this.farm,
    this.contract,
    this.dtContract,
    this.dtContractEnd,
    this.attachments,
    this.description,
    this.costCenters,
    this.plots,
    this.contractType,
    this.attachmentNames,
    this.externalCode,
    this.contractCoverages,
    this.deductiblePrice,
    this.fixedPrice,
    this.items,
  });

  @override
  List<Object?> get props => [
        id,
        company,
        contractedCompany,
        ruralProducer,
        farm,
        contract,
        dtContract,
        dtContractEnd,
        attachments,
        description,
        costCenters,
        plots,
      ];
}
