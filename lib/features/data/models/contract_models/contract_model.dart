import 'dart:convert';
import '../../../domain/entities/contract_entities/contract_entity.dart';
import '../company_models/company_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../farm_models/farm_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import '../plot_models/plot_model.dart';
import '../rural_producer_models/rural_producer_model.dart';
import 'contract_coverage_model.dart';
import 'contract_item_model.dart';
import 'contract_type_model.dart';

class ContractModel extends ContractEntity {
  const ContractModel({
    required super.id,
    required super.company,
    required super.contractedCompany,
    required super.ruralProducer,
    required super.farm,
    required super.contract,
    required super.dtContract,
    required super.dtContractEnd,
    required super.attachments,
    required super.description,
    required super.costCenters,
    required super.plots,required super.contractType,
    required super.attachmentNames,
    required super.externalCode,
    required super.contractCoverages,
    required super.deductiblePrice,
    required super.fixedPrice,
    required super.items,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'company': (company as CompanyModel).toMap(),
    'contractedCompany': (contractedCompany as CompanyModel).toMap(),
    'ruralProducer': (ruralProducer as RuralProducerModel).toMap(),
    'farm': (farm as FarmModel).toMap(),
    'contract': contract,
    'dtContract': dtContract,
    'dtContractEnd': dtContractEnd,
    'attachments': attachments
        .map((e) => (e as MultipartFileCustomModel).toMap())
        .toList(),
    'description': description,
    'costCenters':
    costCenters.map((e) => (e as CostCenterModel).toMap()).toList(),
    'plots': plots.map((e) => (e as PlotModel).toMap()).toList(),
    'contractType': (contractType as ContractTypeModel).toMap(),
    'attachmentNames': attachmentNames,
    'externalCode': externalCode,
    'contractCoverages': contractCoverages
        .map((e) => (e as ContractCoverageModel).toMap())
        .toList(),
    'deductiblePrice': deductiblePrice,
    'fixedPrice': fixedPrice,
    'items': items.map((e) => (e as ContractItemModel).toMap()).toList(),
  };

  factory ContractModel.fromMap(Map<String, dynamic> map) => ContractModel(
    id: map['id'],
    company: CompanyModel.fromMap(map['company']),
    contractedCompany: CompanyModel.fromMap(map['contractedCompany']),
    ruralProducer: RuralProducerModel.fromMap(map['ruralProducer']),
    farm: FarmModel.fromMap(map['farm']),
    contract: map['contract'],
    dtContract: map['dtContract'],
    dtContractEnd: map['dtContractEnd'],
    attachments: List<MultipartFileCustomModel>.from(
        map['attachments']?.map((x) => MultipartFileCustomModel.fromMap(x))),
    description: map['description'],
    costCenters: List<CostCenterModel>.from(
        map['costCenters']?.map((x) => CostCenterModel.fromMap(x))),
    plots: List<PlotModel>.from(map['plots']?.map((x) => PlotModel.fromMap(x))),
    contractType: ContractTypeModel.fromMap(map['contractType']),
    attachmentNames: List<String>.from(map['attachmentNames']),
    externalCode: map['externalCode'],
    contractCoverages: List<ContractCoverageModel>.from(
        map['contractCoverages']?.map((x) => ContractCoverageModel.fromMap(x))),
    deductiblePrice: map['deductiblePrice'],
    fixedPrice: map['fixedPrice'],
    items: List<ContractItemModel>.from(
        map['items']?.map((x) => ContractItemModel.fromMap(x))),
  );

  String toJson() => json.encode(toMap());

  factory ContractModel.fromJson(String source) =>
      ContractModel.fromMap(json.decode(source));
}