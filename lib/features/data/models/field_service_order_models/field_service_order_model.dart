import 'dart:convert';
import '../../../domain/entities/field_service_order_entities/field_service_order_entity.dart';
import '../agricultural_models/agricultural_activity_model.dart';
import '../company_models/company_history_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_history_model.dart';
import '../crop_models/crop_diversity_history_model.dart';
import '../employee_models/employee_history_model.dart';
import '../farm_models/farm_history_model.dart';
import '../inventory_models/inventory_history_model.dart';
import '../machine_implement_models/machine_implement_history_model.dart';
import '../pest_models/pest_model.dart';
import '../plot_models/plot_history_model.dart';
import '../products_models/product_usage_recommendation_model.dart';
import 'field_service_order_type_model.dart';

class FieldServiceOrderModel extends FieldServiceOrderEntity {
  const FieldServiceOrderModel({
    required super.id,
    required super.activityStart,
    required super.activityEnd,
    required super.farm,
    required super.plots,
    required super.areaTotal,
    required super.cropDiversity,
    required super.machineImplements,
    required super.inventories,
    required super.productRecommendations,
    required super.agriculturalActivity,
    required super.costCenter,
    required super.expectedStartDate,
    required super.expectedEndDate,
    required super.employeeActivityHolder,
    required super.employees,
    required super.companies,
    required super.contract,
    required super.description,
    required super.activityValue,
    required super.status,
    required super.fieldServiceOrderType,
    required super.pests,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'activityStart': activityStart,
    'activityEnd': activityEnd,
    'farm': (farm as FarmHistoryModel).toMap(),
    'plots': plots.map((e) => (e as PlotHistoryModel).toMap()).toList(),
    'areaTotal': areaTotal,
    'cropDiversity': (cropDiversity as CropDiversityHistoryModel).toMap(),
    'machineImplements': machineImplements
        .map((e) => (e as MachineImplementHistoryModel).toMap())
        .toList(),
    'inventories': inventories
        .map((e) => (e as InventoryHistoryModel).toMap())
        .toList(),
    'productRecommendations': productRecommendations
        .map((e) => (e as ProductUsageRecommendationModel).toMap())
        .toList(),
    'agriculturalActivity':
    (agriculturalActivity as AgriculturalActivityModel).toMap(),
    'costCenter': (costCenter as CostCenterHistoryModel).toMap(),
    'expectedStartDate': expectedStartDate,
    'expectedEndDate': expectedEndDate,
    'employeeActivityHolder':
    (employeeActivityHolder as EmployeeHistoryModel).toMap(),
    'employees':
    employees.map((e) => (e as EmployeeHistoryModel).toMap()).toList(),
    'companies':
    companies.map((e) => (e as CompanyHistoryModel).toMap()).toList(),
    'contract': (contract as ContractModel).toMap(),
    'description': description,
    'activityValue': activityValue,
    'status': status,
    'fieldServiceOrderType':
    (fieldServiceOrderType as FieldServiceOrderTypeModel).toMap(),
    'pests': pests.map((e) => (e as PestModel).toMap()).toList(),
  };

  factory FieldServiceOrderModel.fromMap(Map<String, dynamic> map) =>
      FieldServiceOrderModel(
        id: map['id'],
        activityStart: map['activityStart'],
        activityEnd: map['activityEnd'],
        farm: FarmHistoryModel.fromMap(map['farm']),
        plots: List<PlotHistoryModel>.from(
            map['plots']?.map((x) => PlotHistoryModel.fromMap(x))),
        areaTotal: map['areaTotal'],
        cropDiversity: CropDiversityHistoryModel.fromMap(map['cropDiversity']),
        machineImplements: List<MachineImplementHistoryModel>.from(
            map['machineImplements']
                ?.map((x) => MachineImplementHistoryModel.fromMap(x))),
        inventories: List<InventoryHistoryModel>.from(
            map['inventories']?.map((x) => InventoryHistoryModel.fromMap(x))),
        productRecommendations: List<ProductUsageRecommendationModel>.from(
            map['productRecommendations']
                ?.map((x) => ProductUsageRecommendationModel.fromMap(x))),
        agriculturalActivity:
        AgriculturalActivityModel.fromMap(map['agriculturalActivity']),
        costCenter: CostCenterHistoryModel.fromMap(map['costCenter']),
        expectedStartDate: map['expectedStartDate'],
        expectedEndDate: map['expectedEndDate'],
        employeeActivityHolder:
        EmployeeHistoryModel.fromMap(map['employeeActivityHolder']),
        employees: List<EmployeeHistoryModel>.from(
            map['employees']?.map((x) => EmployeeHistoryModel.fromMap(x))),
        companies: List<CompanyHistoryModel>.from(
            map['companies']?.map((x) => CompanyHistoryModel.fromMap(x))),
        contract: ContractModel.fromMap(map['contract']),
        description: map['description'],
        activityValue: map['activityValue'],
        status: map['status'],
        fieldServiceOrderType:
        FieldServiceOrderTypeModel.fromMap(map['fieldServiceOrderType']),
        pests:
        List<PestModel>.from(map['pests']?.map((x) => PestModel.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  factory FieldServiceOrderModel.fromJson(String source) =>
      FieldServiceOrderModel.fromMap(json.decode(source));

}