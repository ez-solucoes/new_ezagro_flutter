import 'package:equatable/equatable.dart';
import '../address_entities/address_entity.dart';
import '../company_entities/company_entity.dart';
import '../contract_entities/contract_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../plot_entities/plot_entity.dart';

class FarmEntity extends Equatable {
  final int id;
  final AddressEntity? address;
  final String? car;
  final String? stateRegistration;
  final String? externalCode;
  final String? caepf;
  final String? cnae;
  final String? nameLandowner;
  final String? recordLandowner;
  final CompanyEntity? company;
  final List<PlotEntity>? plots;
  final String? name;
  final int? areaAcre;
  final List<ContractEntity>? contracts;
  final List<MultipartFileCustomEntity>? attachments;
  final String? attachmentNames;
  final List<CostCenterEntity>? costCenters;

  const FarmEntity({
    required this.id,
    this.address,
    this.car,
    this.stateRegistration,
    this.externalCode,
    this.caepf,
    this.cnae,
    this.nameLandowner,
    this.recordLandowner,
    this.company,
    this.plots,
    this.name,
    this.areaAcre,
    this.contracts,
    this.attachments,
    this.costCenters,
    this.attachmentNames,
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
