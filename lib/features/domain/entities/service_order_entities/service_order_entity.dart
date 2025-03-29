import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/contract_entities/contract_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/harvest_entities/harvest_cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_usage_recommendation_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/status_entities/status_entity.dart';

import '../company_entities/company_entity.dart';
import '../crop_entities/crop_variety_entity.dart';

class ServiceOrderEntity extends Equatable {
  final int id;
  final int? harvestOrderNumber;
  final String? expectedStartDate;
  final String? expectedEndDate;
  final String? startDate;
  final String? endDate;
  final String? value;
  final bool? newPlanting;
  final String? area;
  final bool? isProvidedAsService;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? approvalDate;
  final String? cancelDate;
  final AgriculturalActivityEntity? agriculturalActivity;
  final AgriculturalActivityEntity? agriculturalSubActivity;
  final StatusEntity? status;
  final List<MachineryImplementActivityEntity>? machineryImplements;
  final List<ServiceOrderEmployeeEntity>? employees;
  final List<PlotEntity>? plots;
  final List<ProductUsageRecommendationEntity>? productInputRecommendations;
  final List<String>? notes;
  final List<PestEntity>? pests;
  final List<String>? suspensions;
  final FarmEntity? farm;
  final CostCenterEntity? localCostCenter;
  final HarvestCostCenterEntity? harvestCostCenter;
  final CropVarietyEntity? cropVariety;
  final ContractEntity? contract;
  final CompanyEntity? company;


  const ServiceOrderEntity({
      required this.id,
      this.harvestOrderNumber,
      this.expectedStartDate,
      this.expectedEndDate,
      this.startDate,
      this.endDate,
      this.value,
      this.newPlanting,
      this.area,
      this.isProvidedAsService,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.approvalDate,
      this.cancelDate,
      this.agriculturalActivity,
      this.agriculturalSubActivity,
      this.status,
      this.machineryImplements,
      this.employees,
      this.plots,
      this.productInputRecommendations,
      this.notes,
      this.pests,
      this.suspensions,
      this.farm,
      this.localCostCenter,
    this.harvestCostCenter,
      this.cropVariety,
      this.contract,
      this.company,
  });

  @override
  List<Object?> get props => [
    id,
    harvestOrderNumber,
    expectedStartDate,
    expectedEndDate,
    startDate,
    endDate,
    value,
    newPlanting,
    area,
    isProvidedAsService,
    createdAt,
    updatedAt,
    deletedAt,
    approvalDate,
    cancelDate,
    agriculturalActivity,
    agriculturalSubActivity,
    status,
    machineryImplements,
    employees,
    plots,
    productInputRecommendations,
    notes,
    pests,
    suspensions,
    farm,
    localCostCenter,
    harvestCostCenter,
    cropVariety,
    contract,
    company,
  ];

}
