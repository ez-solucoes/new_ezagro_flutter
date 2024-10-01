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
  final CompanyEntity company;
  final CompanyEntity contractedCompany;
  final RuralProducerEntity ruralProducer;
  final FarmEntity farm;
  final String contract;
  final String dtContract;
  final String dtContractEnd;
  final List<MultipartFileCustomEntity> attachments;
  final String description;
  final List<CostCenterEntity> costCenters;
  final List<PlotEntity> plots;
  final ContractTypeEntity contractType;
  final List<String> attachmentNames;
  final String externalCode;
  final List<ContractCoverageEntity> contractCoverages;
  final double deductiblePrice;
  final double fixedPrice;
  final List<ContractItemEntity> items;

  const ContractEntity({
    required this.id,
    required this.company,
    required this.contractedCompany,
    required this.ruralProducer,
    required this.farm,
    required this.contract,
    required this.dtContract,
    required this.dtContractEnd,
    required this.attachments,
    required this.description,
    required this.costCenters,
    required this.plots,
    required this.contractType,
    required this.attachmentNames,
    required this.externalCode,
    required this.contractCoverages,
    required this.deductiblePrice,
    required this.fixedPrice,
    required this.items,
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
