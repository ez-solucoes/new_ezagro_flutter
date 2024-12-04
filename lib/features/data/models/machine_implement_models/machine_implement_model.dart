import 'dart:convert';
import '../../../domain/entities/machine_implement_entities/machine_implement_entity.dart';
import '../brand_models/brand_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../department_models/department_model/department_model.dart';
import '../department_models/sub_department_model/sub_department_model.dart';
import '../local_time_model/local_time_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import 'machine_implement_maintenance_model.dart';
import 'machine_implement_type_model.dart';


class MachineImplementModel extends MachineImplementEntity {
  const MachineImplementModel({
    required super.id,
    super.description,
    super.kilometers,
    super.maintenanceHours,
    super.maintenanceDate,
    super.nickname,
    super.chassis,
    super.invoice,
    super.insurancePolicy,
    super.brand,
    super.machineImplementType,
    super.isExternal,
    super.hourMeter,
    super.yearOfManufacture,
    super.place,
    super.department,
    super.subDepartment,
    super.costCenters,
    super.model,
    super.renavan,
    super.assetNumber,
    super.telemetryData,
    super.documentNumber,
    super.documentType,
    super.tankCapacity,
    super.dtInsuranceExpiration,
    super.dtAcquisition,
    super.acquisitionValue,
    super.machineImplementMaintenances,
    super.attachments,
    super.attachmentNames,
  });

  String toJson() => json.encode(toMap());

  factory MachineImplementModel.fromJson(String source) =>
      MachineImplementModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'kilometers': kilometers,
    'maintenanceHours': maintenanceHours == null ? null : (maintenanceHours as LocalTimeModel).toMap(),
    'maintenanceDate': maintenanceDate,
    'nickname': nickname,
    'chassis': chassis,
    'invoice': invoice,
    'insurancePolicy': insurancePolicy == null ? null : (insurancePolicy as ContractModel).toMap(),
    'brand': brand == null ? null : (brand as BrandModel).toMap(),
    'machineImplementType': machineImplementType == null ? null : (machineImplementType as MachineImplementTypeModel).toMap(),
    'isExternal': isExternal,
    'hourMeter': hourMeter,
    'yearOfManufacture': yearOfManufacture == null ? null : (yearOfManufacture as YearOfManufactureModel).toMap(),
    'place': place,
    'department': department == null ? null : (department as DepartmentModel).toMap(),
    'subDepartment': subDepartment == null ? null : (subDepartment as DepartmentModel).toMap(),
    'costCenters':
    costCenters?.map((e) => (e as CostCenterModel).toMap()).toList(),
    'model': model,
    'renavan': renavan,
    'assetNumber': assetNumber,
    'telemetryData': telemetryData,
    'documentNumber': documentNumber,
    'documentType': documentType,
    'tankCapacity': tankCapacity,
    'dtInsuranceExpiration': dtInsuranceExpiration,
    'dtAcquisition': dtAcquisition,
    'acquisitionValue': acquisitionValue,
    'machineImplementMaintenances': machineImplementMaintenances
        ?.map((e) => (e as MachineImplementMaintenanceModel).toMap())
        .toList(),
    'attachments':
    attachments?.map((e) => (e as MultipartFileCustomModel).toMap()).toList(),
    'attachmentNames': attachmentNames,
  };

  factory MachineImplementModel.fromMap(Map<String, dynamic> map) =>
      MachineImplementModel(
        id: map['id'],
        description: map['description'],
        kilometers: map['kilometers'],
        maintenanceHours: map['maintenanceHours'] == null ? null : LocalTimeModel.fromMap(map['maintenanceHours']),
        maintenanceDate: map['maintenanceDate'],
        nickname: map['nickname'],
        chassis: map['chassis'],
        invoice: map['invoice'],
        insurancePolicy: map['insurancePolicy'] == null ? null : ContractModel.fromMap(map['insurancePolicy']),
        brand: map['brand'] == null ? null : BrandModel.fromMap(map['brand']),
        machineImplementType: map['machineImplementType'] == null ? null : MachineImplementTypeModel.fromMap(map['machineImplementType']),
        isExternal: map['isExternal'],
        hourMeter: map['hourMeter'],
        yearOfManufacture: map['yearOfManufacture'],
        place: map['place'],
        department: map['department'] == null ? null : DepartmentModel.fromMap(map['department']),
        subDepartment: map['subDepartment'] == null ? null : SubDepartmentModel.fromMap(map['subDepartment']),
        costCenters: map['costCenters'] == null ? null : List<CostCenterModel>.from(
            map['costCenters']?.map((x) => CostCenterModel.fromMap(x))),
        model: map['model'],
        renavan: map['renavan'],
        assetNumber: map['assetNumber'],
        telemetryData: map['telemetryData'],
        documentNumber: map['documentNumber'],
        documentType: map['documentType'],
        tankCapacity: map['tankCapacity'],
        dtInsuranceExpiration: map['dtInsuranceExpiration'],
        dtAcquisition: map['dtAcquisition'],
        acquisitionValue: map['acquisitionValue'],
        machineImplementMaintenances: map['machineImplementMaintenances'] == null ? null : List<MachineImplementMaintenanceModel>.from(
            map['machineImplementMaintenances']
                ?.map((x) => MachineImplementMaintenanceModel.fromMap(x))),
        attachments: map['attachments'] == null ? null : List<MultipartFileCustomModel>.from(
            map['attachments']?.map((x) => MultipartFileCustomModel.fromMap(x))),
        attachmentNames: map['attachmentNames'],
      );
}

class YearOfManufactureModel extends YearOfManufacture {
  const YearOfManufactureModel({super.value, super.leap});

  String toJson() => json.encode(toMap());

  factory YearOfManufactureModel.fromJson(String source) =>
      YearOfManufactureModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'value': value,
    'leap': leap,
  };

  factory YearOfManufactureModel.fromMap(Map<String, dynamic> map) =>
      YearOfManufactureModel(
        value: map['value'],
        leap: map['leap'],
      );
}