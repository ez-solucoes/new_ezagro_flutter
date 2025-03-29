
import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/contract_models/contract_model.dart';
import 'package:new_ezagro_flutter/features/data/models/harvest_models/harvest_cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/status_models/status_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_entity.dart';

import '../company_models/company_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../crop_models/crop_variety_model.dart';
import '../farm_models/farm_model.dart';
import '../products_models/product_usage_recommendation_model.dart';

class ServiceOrderModel extends ServiceOrderEntity {

  const ServiceOrderModel({
    required super.id,
    super.harvestOrderNumber,
    super.expectedStartDate,
    super.expectedEndDate,
    super.startDate,
    super.endDate,
    super.value,
    super.newPlanting,
    super.area,
    super.isProvidedAsService,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.approvalDate,
    super.cancelDate,
    super.agriculturalActivity,
    super.agriculturalSubActivity,
    super.status,
    super.machineryImplements,
    super.employees,
    super.plots,
    super.productInputRecommendations,
    super.notes,
    super.pests,
    super.suspensions,
    super.farm,
    super.localCostCenter,
    super.harvestCostCenter,
    super.cropVariety,
    super.contract,
    super.company,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'harvestOrderNumber': harvestOrderNumber,
      'expectedStartDate': expectedStartDate,
      'expectedEndDate': expectedEndDate,
      'startDate': startDate,
      'endDate': endDate,
      'value': value,
      'newPlanting': newPlanting,
      'area': area,
      'isProvidedAsService': isProvidedAsService,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'approvalDate': approvalDate,
      'cancelDate': cancelDate,
      'status': status,
      'employees': employees,
      'agriculturalActivity': agriculturalActivity,
      'localCostCenter': localCostCenter,
      'farm': farm,
      'agriculturalSubActivity': agriculturalSubActivity,
      'machineryImplements': machineryImplements,
      'plots': plots,
      'productInputRecommendations': productInputRecommendations,
      'notes': notes,
      'pests': pests,
      'suspensions': suspensions,
      'harvestCostCenter': harvestCostCenter,
      'cropVariety': cropVariety,
      'contract': contract,
      'company': company,
    };
  }

  factory ServiceOrderModel.fromMap(Map<String, dynamic> map) {
    return ServiceOrderModel(
      id: map['id'] as int,
      harvestOrderNumber: map['harvestOrderNumber'] as int?,
      expectedStartDate: map['expectedStartDate'] as String?,
      expectedEndDate: map['expectedEndDate'] as String?,
      startDate: map['startDate'] as String?,
      endDate: map['endDate'] as String?,
      value: map['value'] as String?,
      newPlanting: map['newPlanting'] as bool?,
      area: map['area'] as String?,
      isProvidedAsService: map['isProvidedAsService'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      approvalDate: map['approvalDate'] as String?,
      cancelDate: map['cancelDate'] as String?,
      agriculturalActivity: map['agriculturalActivity'] == null ? null : AgriculturalActivityModel.fromMap(map['agriculturalActivity']),
      agriculturalSubActivity: map['agriculturalSubActivity'] == null ? null : AgriculturalActivityModel.fromMap(map['agriculturalSubActivity']),
      status: map['status'] == null ? null : StatusModel.fromMap(map['status']),
      machineryImplements: map['machineryImplements'] == null ? null : List<MachineryImplementActivityModel>.from(map['machineryImplements'].map((x) => MachineryImplementActivityModel.fromMap(x))),
      employees: map['employees'] == null ? null : List<ServiceOrderEmployeeModel>.from(map['employees'].map((x) => ServiceOrderEmployeeModel.fromMap(x))),
      plots: map['plots'] == null ? null : List<PlotModel>.from(map['plots'].map((x) => PlotModel.fromMap(x))),
      productInputRecommendations: map['productInputRecommendations'] == null ? null : List<ProductUsageRecommendationModel>.from(map['productInputRecommendations'].map((x) => ProductUsageRecommendationModel.fromMap(x))),
      notes: map['notes'] == null ? null : List<String>.from(map['notes'].map((x) => x)),
      pests: map['pests'] == null ? null : List<PestModel>.from(map['pests'].map((x) => PestModel.fromMap(x))),
      suspensions: map['suspensions'] == null ? null : List<String>.from(map['suspensions'].map((x) => x)),
      farm: map['farm'] == null ? null : FarmModel.fromMap(map['farm']),
      localCostCenter: map['localCostCenter'] == null ? null : CostCenterModel.fromMap(map['localCostCenter']),
      harvestCostCenter: map['harvestCostCenter'] == null ? null : HarvestCostCenterModel.fromMap(map['harvestCostCenter']),
      cropVariety: map['cropVariety'] == null ? null : CropVarietyModel.fromMap(map['cropVariety']),
      contract: map['contract'] == null ? null : ContractModel.fromMap(map['contract']),
      company: map['company'] == null ? null : CompanyModel.fromMap(map['company']),

    );
  }
  
  factory ServiceOrderModel.fromEntity(ServiceOrderEntity entity) {
    return ServiceOrderModel(
      id: entity.id,
      harvestOrderNumber: entity.harvestOrderNumber,
      expectedStartDate: entity.expectedStartDate,
      expectedEndDate: entity.expectedEndDate,
      startDate: entity.startDate,
      endDate: entity.endDate,
      value: entity.value,
      newPlanting: entity.newPlanting,
      area: entity.area,
      isProvidedAsService: entity.isProvidedAsService,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      approvalDate: entity.approvalDate,
      cancelDate: entity.cancelDate,
      agriculturalActivity: entity.agriculturalActivity,
      agriculturalSubActivity: entity.agriculturalSubActivity,
      status: entity.status,
      machineryImplements: entity.machineryImplements,
      employees: entity.employees,
      plots: entity.plots,
      productInputRecommendations: entity.productInputRecommendations,
      notes: entity.notes,
      pests: entity.pests,
      suspensions: entity.suspensions,
      farm: entity.farm,
      localCostCenter: entity.localCostCenter,
      harvestCostCenter: entity.harvestCostCenter,
      cropVariety: entity.cropVariety,
      contract: entity.contract,
      company: entity.company,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceOrderModel.fromJson(String source) =>
      ServiceOrderModel.fromMap(json.decode(source));

  static List<ServiceOrderModel> fromListMap(List list) =>
      list.map((e) => ServiceOrderModel.fromMap(e)).toList();

  static List<ServiceOrderModel> fromJsonList(String source) =>
      (json.decode(source) as List)
        .map((e) => ServiceOrderModel.fromMap(e))
        .toList();
}