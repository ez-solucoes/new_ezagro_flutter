import 'package:equatable/equatable.dart';
import '../agricultural_entities/agricultural_activity_entity.dart';
import '../company_entities/company_history_entity.dart';
import '../contract_entities/contract_entity.dart';
import '../cost_center_entities/cost_center_history_entity.dart';
import '../crop_entities/crop_diversity_history_entity.dart';
import '../employee_entities/employee_history_entity.dart';
import '../farm_entities/farm_history_entity.dart';
import '../inventory_entities/inventory_history_entity.dart';
import '../machine_implement_entities/machine_implement_entity.dart';
import '../pest_entities/pest_entity.dart';
import '../plot_entities/plot_history_entity.dart';
import '../products_entities/product_usage_recommendation_entity.dart';
import 'field_service_order_type_entity.dart';

class FieldServiceOrderEntity extends Equatable {
  final int id;
  final String? activityStart;
  final String? activityEnd;
  final FarmHistoryEntity? farm;
  final List<PlotHistoryEntity>?plots;
  final double? areaTotal;
  final CropDiversityHistoryEntity? cropDiversity;
  final List<MachineImplementEntity>? machineImplements;
  final List<InventoryHistoryEntity>? inventories;
  final List<ProductUsageRecommendationEntity>? productRecommendations;
  final AgriculturalActivityEntity? agriculturalActivity;
  final CostCenterHistoryEntity? costCenter;
  final String? expectedStartDate;
  final String? expectedEndDate;
  final EmployeeHistoryEntity? employeeActivityHolder;
  final List<EmployeeHistoryEntity>? employees;
  final List<CompanyHistoryEntity>? companies;
  final ContractEntity? contract;
  final String? description;
  final double? activityValue;
  final String? status;
  final FieldServiceOrderTypeEntity? fieldServiceOrderType;
  final List<PestEntity>? pests;

  const FieldServiceOrderEntity({
    required this.id,
    this.activityStart,
    this.activityEnd,
    this.farm,
    this.plots,
    this.areaTotal,
    this.cropDiversity,
    this.machineImplements,
    this.inventories,
    this.productRecommendations,
    this.agriculturalActivity,
    this.costCenter,
    this.expectedStartDate,
    this.expectedEndDate,
    this.employeeActivityHolder,
    this.employees,
    this.companies,
    this.contract,
    this.description,
    this.activityValue,
    this.status,
    this.fieldServiceOrderType,
    this.pests,
  });

  @override
  List<Object?> get props => [
    id,
    activityStart,
    activityEnd,
    farm,
    plots,
    areaTotal,
    cropDiversity,
    machineImplements,
    inventories,
    productRecommendations,
    agriculturalActivity,
    costCenter,
    expectedStartDate,
    expectedEndDate,
    employeeActivityHolder,
    employees,
    companies,
    contract,
    description,
    activityValue,
    status,
    fieldServiceOrderType,
    pests,
  ];
}
