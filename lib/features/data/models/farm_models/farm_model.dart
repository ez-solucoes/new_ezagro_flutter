import 'dart:convert';

import '../../../domain/entities/farm_entities/farm_entity.dart';
import '../address_models/address_model.dart';
import '../company_models/company_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import '../plot_models/plot_model.dart';

class FarmModel extends FarmEntity {
  const FarmModel({
    required super.id,
    super.address,
    super.car,
    super.stateRegistration,
    super.externalCode,
    super.caepf,
    super.cnae,
    super.nameLandowner,
    super.recordLandowner,
    super.company,
    super.plots,
    super.name,
    super.areaAcre,
    super.contracts,
    super.attachments,
    super.costCenters,
    super.attachmentNames,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'address': address == null ? null : (address as AddressModel).toMap(),
        'car': car,
        'stateRegistration': stateRegistration,
        'externalCode': externalCode,
        'caepf': caepf,
        'cnae': cnae,
        'nameLandowner': nameLandowner,
        'recordLandowner': recordLandowner,
        'company': (company as CompanyModel).toMap(),
        'plots': plots?.map((e) => (e as PlotModel).toMap()).toList(),
        'name': name,
        'areaAcre': areaAcre,
        'contracts':
            contracts?.map((e) => (e as ContractModel).toMap()).toList(),
        'attachments': attachments
            ?.map((e) => (e as MultipartFileCustomModel).toMap())
            .toList(),
        'attachmentNames': attachmentNames,
        'costCenters':
            costCenters?.map((e) => (e as CostCenterModel).toMap()).toList(),
      };

  factory FarmModel.fromMap(Map<String, dynamic> map) => FarmModel(
        id: map['id'],
        address: map['address'] != null
            ? AddressModel.fromMap(map['address'])
            : null,
        car: map['car'],
        stateRegistration: map['stateRegistration'],
        externalCode: map['externalCode'],
        caepf: map['caepf'],
        cnae: map['cnae'],
        nameLandowner: map['nameLandowner'],
        recordLandowner: map['recordLandowner'],
        company: map['company'] == null
            ? null
            : CompanyModel.fromMap(map['company']),
        plots: List<PlotModel>.from(
            map['plots']?.map((x) => PlotModel.fromMap(x))),
        name: map['name'],
        areaAcre: map['areaAcre'],
        contracts: map['contracts'] == null
            ? null
            : List<ContractModel>.from(
                map['contracts']?.map((x) => ContractModel.fromMap(x))),
        attachments: map['attachments'] == null
            ? null
            : List<MultipartFileCustomModel>.from(map['attachments']
                ?.map((x) => MultipartFileCustomModel.fromMap(x))),
        attachmentNames: "",
        //map['attachmentNames'],
        costCenters: map['costCenters'] == null
            ? null
            : List<CostCenterModel>.from(
                map['costCenters']?.map((x) => CostCenterModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory FarmModel.fromJson(String source) =>
      FarmModel.fromMap(json.decode(source));
}
