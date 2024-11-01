import 'package:equatable/equatable.dart';
import '../brand_entities/brand_entity.dart';
import '../contract_entities/contract_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../departmentEntities/department_entity.dart';
import '../local_time_entities/local_time_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import 'machine_implement_maintenance_entity.dart';
import 'machine_implement_type_entity.dart';

class MachineImplementEntity extends Equatable {
  final int id;
  final String? description;
  final int? kilometers;
  final LocalTimeEntity? maintenanceHours;
  final String? maintenanceDate;
  final String? nickname;
  final String? chassis;
  final int? invoice;
  final ContractEntity? insurancePolicy;
  final BrandEntity? brand;
  final MachineImplementTypeEntity? machineImplementType;
  final bool? isExternal;
  final double? hourMeter;
  final String? yearOfManufacture;
  final String? place;
  final DepartmentEntity? department;
  final DepartmentEntity? subDepartment;
  final List<CostCenterEntity>? costCenters;
  final String? model;
  final String? renavan;
  final String? assetNumber;
  final String? telemetryData;
  final String? documentNumber;
  final String? documentType;
  final double? tankCapacity;
  final String? dtInsuranceExpiration;
  final String? dtAcquisition;
  final double?acquisitionValue;
  final List<MachineImplementMaintenanceEntity>? machineImplementMaintenances;
  final List<MultipartFileCustomEntity>? attachments;
  final String? attachmentNames;

  const MachineImplementEntity({
    required this.id,
    this.description,
    this.kilometers,
    this.maintenanceHours,
    this.maintenanceDate,
    this.nickname,
    this.chassis,
    this.invoice,
    this.insurancePolicy,
    this.brand,
    this.machineImplementType,
    this.isExternal,
    this.hourMeter,
    this.yearOfManufacture,
    this.place,
    this.department,
    this.subDepartment,
    this.costCenters,
    this.model,
    this.renavan,
    this.assetNumber,
    this.telemetryData,
    this.documentNumber,
    this.documentType,
    this.tankCapacity,
    this.dtInsuranceExpiration,
    this.dtAcquisition,
    this.acquisitionValue,
    this.machineImplementMaintenances,
    this.attachments,
    this.attachmentNames,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        kilometers,
        maintenanceHours,
        maintenanceDate,
        nickname,
        chassis,
        invoice,
        insurancePolicy,
        brand,
        machineImplementType,
        isExternal,
        hourMeter,
        yearOfManufacture,
        place,
        department,
        subDepartment,
        costCenters,
        model,
        renavan,
        assetNumber,
        telemetryData,
        documentNumber,
        documentType,
        tankCapacity,
        dtInsuranceExpiration,
        dtAcquisition,
        acquisitionValue,
        machineImplementMaintenances,
        attachments,
        attachmentNames,
      ];
}

class YearOfManufacture extends Equatable {
  final int? value;
  final bool? leap;

  const YearOfManufacture({
    this.value,
    this.leap,
  });

  @override
  List<Object?> get props => [
        value,
        leap,
      ];
}
