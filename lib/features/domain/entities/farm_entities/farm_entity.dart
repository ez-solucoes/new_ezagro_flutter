import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';

import '../rural_producer_entities/rural_producer_entity.dart';

class FarmEntity extends Equatable {
  final int id;
  final String? name;
  final String? externalCode;
  final String? ownerName;
  final String? stateRegistration;
  final String? car;
  final String? caepf;
  final String? cnae;
  final double? headquarterLatitude;
  final double? headquarterLongitude;
  final String? addressZipCode;
  final String? addressStreet;
  final int? addressNumber;
  final String? addressCountry;
  final String? addressNeighborhood;
  final String? addressCity;
  final String? addressState;
  final String? addressComplement;
  final String? addressReference;
  final bool? isFavorite;
  final bool? isOwn;
  final String? area;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final CostCenterEntity? localCostCenter;
  final CompanyEntity? company;
  final List<PlotEntity>? plots;
  final List<RuralProducerEntity>? ruralProducers;

  const FarmEntity({
    required this.id,
    this.name,
    this.ownerName,
    this.stateRegistration,
    this.car,
    this.caepf,
    this.cnae,
    this.headquarterLatitude,
    this.headquarterLongitude,
    this.addressZipCode,
    this.addressStreet,
    this.addressNumber,
    this.addressCountry,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
    this.addressComplement,
    this.addressReference,
    this.isFavorite,
    this.area,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.localCostCenter,
    this.company,
    this.plots,
    this.ruralProducers,
    this.externalCode,
    this.isOwn,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    ownerName,
    stateRegistration,
    car,
    caepf,
    cnae,
    headquarterLatitude,
    headquarterLongitude,
    addressZipCode,
    addressStreet,
    addressNumber,
    addressCountry,
    addressNeighborhood,
    addressCity,
    addressState,
    addressComplement,
    addressReference,
    isFavorite,
    area,
    createdAt,
    updatedAt,
    deletedAt,
    localCostCenter,
    company,
    plots,
    ruralProducers,
    externalCode,
    isOwn,
  ];
}