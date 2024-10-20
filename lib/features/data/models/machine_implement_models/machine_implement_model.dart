import 'dart:convert';

import '../../../domain/entities/machine_implement_entities/machine_implement_entity.dart';
import '../brand_models/brand_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../department_models/department_model.dart';
import '../local_time_model/local_time_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import 'machine_implement_maintenance_model.dart';
import 'machine_implement_type_model.dart';

class MachineImplementModel extends MachineImplementEntity {
  const MachineImplementModel({
    required super.id,
    required super.description,
    required super.kilometers,
    required super.maintenanceHours,
    required super.maintenanceDate,
    required super.nickname,
    required super.chassis,
    required super.invoice,
    required super.insurancePolicy,
    required super.brand,
    required super.machineImplementType,
    required super.isExternal,
    required super.hourMeter,
    required super.yearOfManufacture,
    required super.place,
    required super.department,
    required super.subDepartment,
    required super.costCenters,
    required super.model,
    required super.renavan,
    required super.assetNumber,
    required super.telemetryData,
    required super.documentNumber,
    required super.documentType,
    required super.tankCapacity,
    required super.dtInsuranceExpiration,
    required super.dtAcquisition,
    required super.acquisitionValue,
    required super.machineImplementMaintenances,
    required super.attachments,
    required super.attachmentNames,
  });

  String toJson() => json.encode(toMap());

  factory MachineImplementModel.fromJson(String source) =>
      MachineImplementModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'description': description,
        'kilometers': kilometers,
        'maintenanceHours': (maintenanceHours as LocalTimeModel).toMap(),
        'maintenanceDate': maintenanceDate,
        'nickname': nickname,
        'chassis': chassis,
        'invoice': invoice,
        'insurancePolicy': (insurancePolicy as ContractModel).toMap(),
        'brand': (brand as BrandModel).toMap(),
        'machineImplementType':
            (machineImplementType as MachineImplementTypeModel).toMap(),
        'isExternal': isExternal,
        'hourMeter': hourMeter,
        'yearOfManufacture':
            (yearOfManufacture as YearOfManufactureModel).toMap(),
        'place': place,
        'department': (department as DepartmentModel).toMap(),
        'subDepartment': (subDepartment as DepartmentModel).toMap(),
        'costCenters':
            costCenters.map((e) => (e as CostCenterModel).toMap()).toList(),
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
            .map((e) => (e as MachineImplementMaintenanceModel).toMap())
            .toList(),
        'attachments': attachments
            .map((e) => (e as MultipartFileCustomModel).toMap())
            .toList(),
        'attachmentNames': attachmentNames,
      };

  factory MachineImplementModel.fromMap(Map<String, dynamic> map) =>
      MachineImplementModel(
        id: map['id'],
        description: map['description'],
        kilometers: map['kilometers'],
        maintenanceHours: LocalTimeModel.fromMap(map['maintenanceHours']),
        maintenanceDate: map['maintenanceDate'],
        nickname: map['nickname'],
        chassis: map['chassis'],
        invoice: map['invoice'],
        insurancePolicy: ContractModel.fromMap(map['insurancePolicy']),
        brand: BrandModel.fromMap(map['brand']),
        machineImplementType:
            MachineImplementTypeModel.fromMap(map['machineImplementType']),
        isExternal: map['isExternal'],
        hourMeter: map['hourMeter'],
        yearOfManufacture:
            YearOfManufactureModel.fromMap(map['yearOfManufacture']),
        place: map['place'],
        department: DepartmentModel.fromMap(map['department']),
        subDepartment: DepartmentModel.fromMap(map['subDepartment']),
        costCenters: List<CostCenterModel>.from(
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
        machineImplementMaintenances:
            List<MachineImplementMaintenanceModel>.from(
                map['machineImplementMaintenances']
                    ?.map((x) => MachineImplementMaintenanceModel.fromMap(x))),
        attachments: List<MultipartFileCustomModel>.from(map['attachments']
            ?.map((x) => MultipartFileCustomModel.fromMap(x))),
        attachmentNames: map['attachmentNames'],
      );
}

class YearOfManufactureModel extends YearOfManufacture {
  const YearOfManufactureModel({required super.value, required super.leap});

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
