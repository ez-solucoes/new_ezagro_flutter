import 'dart:convert';

import '../../../domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../department_models/department_model/department_model.dart';
import '../department_models/sub_department_model/sub_department_model.dart';
import '../insurance_contract_models/insurance_contract_model.dart';
import 'machinery_implement_type_model.dart';

class MachineryImplementModel extends MachineryImplementEntity {
  const MachineryImplementModel({
    required super.id,
    super.isMachinery,
    super.nickname,
    super.description,
    super.brandName,
    super.modelName,
    super.fabricationYear,
    super.renavam,
    super.assetNumber,
    super.chassisNumber,
    super.workHours,
    super.mileage,
    super.tankCapacity,
    super.invoiceNumber,
    super.acquisitionDate,
    super.acquisitionValue,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.type,
    super.costCenter,
    super.department,
    super.subDepartment,
    super.insuranceContracts,
  });

  String toJson() => json.encode(toMap());

  factory MachineryImplementModel.fromJson(String source) =>
      MachineryImplementModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'isMachinery': isMachinery,
        'nickname': nickname,
        'description': description,
        'brandName': brandName,
        'modelName': modelName,
        'fabricationYear': fabricationYear,
        'renavam': renavam,
        'assetNumber': assetNumber,
        'chassisNumber': chassisNumber,
        'workHours': workHours,
        'mileage': mileage,
        'tankCapacity': tankCapacity,
        'invoiceNumber': invoiceNumber,
        'acquisitionDate': acquisitionDate,
        'acquisitionValue': acquisitionValue,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'type': type == null ? null : (type as MachineryImplementTypeModel).toMap(),
        'costCenter': costCenter == null ? null : (costCenter as CostCenterModel).toMap(),
        'department': department == null ? null : (department as DepartmentModel).toMap(),
        'subDepartment':
            subDepartment == null ? null : (subDepartment as SubDepartmentModel).toMap(),
        'insuranceContracts': insuranceContracts?.map((e) => (e as ContractModel).toMap()).toList(),
      };

  factory MachineryImplementModel.fromMap(Map<String, dynamic> map) => MachineryImplementModel(
        id: map['id'],
        isMachinery: map['isMachinery'],
        nickname: map['nickname'],
        description: map['description'],
        brandName: map['brandName'],
        modelName: map['modelName'],
        fabricationYear: map['fabricationYear'],
        renavam: map['renavam'],
        assetNumber: map['assetNumber'],
        chassisNumber: map['chassisNumber'],
        workHours: map['workHours'],
        mileage: map['mileage'],
        tankCapacity: map['tankCapacity'],
        invoiceNumber: map['invoiceNumber'],
        acquisitionDate: map['acquisitionDate'],
        acquisitionValue: map['acquisitionValue'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
        type: map['type'] == null ? null : MachineryImplementTypeModel.fromMap(map['type']),
        costCenter: map['costCenter'] == null ? null : CostCenterModel.fromMap(map['costCenter']),
        department: map['department'] == null ? null : DepartmentModel.fromMap(map['department']),
        subDepartment:
            map['subDepartment'] == null ? null : SubDepartmentModel.fromMap(map['subDepartment']),
        insuranceContracts: map['insuranceContracts'] == null
            ? null
            : List<InsuranceContractModel>.from(
                map['insuranceContracts']?.map((x) => InsuranceContractModel.fromMap(x))),
      );

  static List<MachineryImplementModel> fromListMap(List list) =>
      list.map((e) => MachineryImplementModel.fromMap(e)).toList();

  static List<MachineryImplementModel> fromJsonList(String source) =>
      (json.decode(source) as List).map((e) => MachineryImplementModel.fromMap(e)).toList();
}
