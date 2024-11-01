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
import '../machine_implement_models/machine_implement_model.dart';
import '../pest_models/pest_model.dart';
import '../plot_models/plot_history_model.dart';
import '../products_models/product_usage_recommendation_model.dart';
import 'field_service_order_type_model.dart';

class FieldServiceOrderModel extends FieldServiceOrderEntity {
  const FieldServiceOrderModel({
    required super.id,
    super.activityStart,
    super.activityEnd,
    super.farm,
    super.plots,
    super.areaTotal,
    super.cropDiversity,
    super.machineImplements,
    super.inventories,
    super.productRecommendations,
    super.agriculturalActivity,
    super.costCenter,
    super.expectedStartDate,
    super.expectedEndDate,
    super.employeeActivityHolder,
    super.employees,
    super.companies,
    super.contract,
    super.description,
    super.activityValue,
    super.status,
    super.fieldServiceOrderType,
    super.pests,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'activityStart': activityStart,
    'activityEnd': activityEnd,
    'farm': (farm as FarmHistoryModel).toMap(),
    'plots': plots?.map((e) => (e as PlotHistoryModel).toMap()).toList(),
    'areaTotal': areaTotal,
    'cropDiversity': (cropDiversity as CropDiversityHistoryModel).toMap(),
    'machineImplements': machineImplements
        ?.map((e) => (e as MachineImplementHistoryModel).toMap())
        .toList(),
    'inventories': inventories
        ?.map((e) => (e as InventoryHistoryModel).toMap())
        .toList(),
    'productRecommendations': productRecommendations
        ?.map((e) => (e as ProductUsageRecommendationModel).toMap())
        .toList(),
    'agriculturalActivity':
    (agriculturalActivity as AgriculturalActivityModel).toMap(),
    'costCenter': (costCenter as CostCenterHistoryModel).toMap(),
    'expectedStartDate': expectedStartDate,
    'expectedEndDate': expectedEndDate,
    'employeeActivityHolder':
    (employeeActivityHolder as EmployeeHistoryModel).toMap(),
    'employees':
    employees?.map((e) => (e as EmployeeHistoryModel).toMap()).toList(),
    'companies':
    companies?.map((e) => (e as CompanyHistoryModel).toMap()).toList(),
    'contract': (contract as ContractModel).toMap(),
    'description': description,
    'activityValue': activityValue,
    'status': status,
    'fieldServiceOrderType':
    (fieldServiceOrderType as FieldServiceOrderTypeModel).toMap(),
    'pests': pests?.map((e) => (e as PestModel).toMap()).toList(),
  };

  factory FieldServiceOrderModel.fromMap(Map<String, dynamic> map) =>
      FieldServiceOrderModel(
        id: map['id'] as int,
        activityStart: map['activityStart'] != null ? map['activityStart'] as String : null,
        activityEnd: map['activityEnd'] != null ? map['activityEnd'] as String : null,
        farm: map['farm'] != null ? FarmHistoryModel.fromMap(map['farm'] as Map<String, dynamic>) : null,
        plots: map['plots'] != null ? List<PlotHistoryModel>.from(
            (map['plots'] as List).map((x) => PlotHistoryModel.fromMap(x as Map<String, dynamic>))) : null,
        areaTotal: map['areaTotal'] != null ? map['areaTotal'] as double : null,
        cropDiversity: map['cropDiversity'] != null ? CropDiversityHistoryModel.fromMap(map['cropDiversity'] as Map<String, dynamic>) : null,
        machineImplements: map['machineImplements'] != null ? List<MachineImplementModel>.from(
            (map['machineImplements'] as List).map((x) => MachineImplementModel.fromMap(x as Map<String, dynamic>))) : null,
        inventories: map['inventories'] != null ? List<InventoryHistoryModel>.from(
            (map['inventories'] as List).map((x) => InventoryHistoryModel.fromMap(x as Map<String, dynamic>))) : null,
        productRecommendations: map['productRecommendations'] != null ? List<ProductUsageRecommendationModel>.from(
            (map['productRecommendations'] as List).map((x) => ProductUsageRecommendationModel.fromMap(x as Map<String, dynamic>))) : null,
        agriculturalActivity: map['agriculturalActivity'] != null ? AgriculturalActivityModel.fromMap(map['agriculturalActivity'] as Map<String, dynamic>) : null,
        costCenter: map['costCenter'] != null ? CostCenterHistoryModel.fromMap(map['costCenter'] as Map<String, dynamic>) : null,
        expectedStartDate: map['expectedStartDate'] != null ? map['expectedStartDate'] as String : null,
        expectedEndDate: map['expectedEndDate'] != null ? map['expectedEndDate'] as String : null,
        employeeActivityHolder: map['employeeActivityHolder'] != null ? EmployeeHistoryModel.fromMap(map['employeeActivityHolder'] as Map<String, dynamic>) : null,
        employees: map['employees'] != null ? List<EmployeeHistoryModel>.from(
            (map['employees'] as List).map((x) => EmployeeHistoryModel.fromMap(x as Map<String, dynamic>))) : null,
        companies: map['companies'] != null ? List<CompanyHistoryModel>.from(
            (map['companies'] as List).map((x) => CompanyHistoryModel.fromMap(x as Map<String, dynamic>))) : null,
        contract: map['contract'] != null ? ContractModel.fromMap(map['contract'] as Map<String, dynamic>) : null,
        description: map['description'] != null ? map['description'] as String : null,
        activityValue: map['activityValue'] != null ? map['activityValue'] as double : null,
        status: map['status'] != null ? map['status'] as String : null,
        fieldServiceOrderType: map['fieldServiceOrderType'] != null ? FieldServiceOrderTypeModel.fromMap(map['fieldServiceOrderType'] as Map<String, dynamic>) : null,
        pests: map['pests'] != null ? List<PestModel>.from(
            (map['pests'] as List).map((x) => PestModel.fromMap(x as Map<String, dynamic>))) : null,
      );

  String toJson() => json.encode(toMap());

  factory FieldServiceOrderModel.fromJson(String source) =>
      FieldServiceOrderModel.fromMap(json.decode(source));

}