
import 'dart:convert';

import '../../../domain/entities/contract_entities/contract_entity.dart';
import '../../../domain/entities/contract_entities/contract_item_entity.dart';
import '../../../domain/entities/cost_center_entities/cost_center_entity.dart';
import '../company_models/company_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../farm_models/farm_model.dart';
import '../rural_producer_models/rural_producer_model.dart';
import 'contract_item_model.dart';
import 'contract_type_model.dart';

class ContractModel extends ContractEntity {
  const ContractModel({
    required super.id,
    super.contract,
    super.externalCode,
    super.startDate,
    super.endDate,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.items,
    super.costCenters,
    super.contractType,
    super.ruralProducer,
    super.farm,
    super.ownCompany,
    super.creditorCompany,
    super.debtorCompany,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contract': contract,
      'externalCode': externalCode,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'items': items?.map((x) => (x as ContractItemModel).toMap()).toList(),
      'costCenters': costCenters?.map((x) => (x as CostCenterModel).toMap()).toList(),
      'contractType': contractType == null ? null : (contractType as ContractTypeModel).toMap(),
      'ruralProducer': ruralProducer == null ? null : (ruralProducer as RuralProducerModel).toMap(),
      'farm': farm == null ? null : (farm as FarmModel).toMap(),
      'ownCompany': ownCompany == null ? null : (ownCompany as CompanyModel).toMap(),
      'creditorCompany': creditorCompany == null ? null : (creditorCompany as CompanyModel).toMap(),
      'debtorCompany': debtorCompany == null ? null : (debtorCompany as CompanyModel).toMap(),
    };
  }

  factory ContractModel.fromMap(Map<String, dynamic> map) {
    return ContractModel(
      id: map['id'] as int,
      contract: map['contract'] as String?,
      externalCode: map['externalCode'] as String?,
      startDate: map['startDate'] as String?,
      endDate: map['endDate'] as String?,
      description: map['description'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      items: map['items'] != null ? List<ContractItemEntity>.from(map['items']?.map((x) => ContractItemModel.fromMap(x as Map<String, dynamic>))) : null,
      costCenters: map['costCenters'] != null ? List<CostCenterEntity>.from(map['costCenters']?.map((x) => CostCenterModel.fromMap(x as Map<String, dynamic>))) : null,
      contractType: map['contractType'] != null ? ContractTypeModel.fromMap(map['contractType'] as Map<String, dynamic>) : null,
      ruralProducer: map['ruralProducer'] != null ? RuralProducerModel.fromMap(map['ruralProducer'] as Map<String, dynamic>) : null,
      farm: map['farm'] != null ? FarmModel.fromMap(map['farm'] as Map<String, dynamic>) : null,
      ownCompany: map['ownCompany'] != null ? CompanyModel.fromMap(map['ownCompany'] as Map<String, dynamic>) : null,
      creditorCompany: map['creditorCompany'] != null ? CompanyModel.fromMap(map['creditorCompany'] as Map<String, dynamic>) : null,
      debtorCompany: map['debtorCompany'] != null ? CompanyModel.fromMap(map['debtorCompany'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractModel.fromJson(String source) => ContractModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<List<String>> convertToTableList(List<ContractEntity> contracts) {
    return contracts.map((e) => [e.id.toString(), e.contract ?? "", e.contractType?.name ?? ""]).toList();
  }
}