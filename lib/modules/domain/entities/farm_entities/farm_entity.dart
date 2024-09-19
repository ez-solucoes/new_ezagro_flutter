import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/contract_entities/contract_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/plot_entities/plot_entity.dart';

import '../address_entities/address_entity.dart';
import '../company_entities/company_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../rural_producer_entities/rural_producer_entity.dart';

class FarmEntity extends Equatable {
  final int id;
  final AddressEntity? address;
  final String car;
  final String stateRegistration;
  final String externalCode;
  final String caepf;
  final String cnae;
  final String nameLandowner;
  final String recordLandowner;
  final CompanyEntity company;
  final List<PlotEntity> plots;
  final String name;
  final int areaAcre;
  final List<ContractEntity> contracts;
  final List<MultipartFileCustom> attachments;
  final String attachmentNames;
  final List<CostCenterEntity> costCenters;

  const FarmEntity({
    required this.id,
    required this.address,
    required this.car,
    required this.stateRegistration,
    required this.externalCode,
    required this.caepf,
    required this.cnae,
    required this.nameLandowner,
    required this.recordLandowner,
    required this.company,
    required this.plots,
    required this.name,
    required this.areaAcre,
    required this.contracts,
    required this.attachments,
    required this.costCenters,
    required this.attachmentNames,
  });

  @override
  List<Object?> get props => [
        id,
        address,
        car,
        stateRegistration,
        externalCode,
        caepf,
        cnae,
        nameLandowner,
        recordLandowner,
        company,
        plots,
        name,
        areaAcre,
        contracts,
        attachments,
        costCenters,
        attachmentNames,
      ];
}
