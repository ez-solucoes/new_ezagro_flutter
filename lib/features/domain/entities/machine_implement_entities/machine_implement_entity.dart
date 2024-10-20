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
  final String description;
  final int kilometers;
  final LocalTimeEntity maintenanceHours;
  final String maintenanceDate;
  final String nickname;
  final String chassis;
  final int invoice;
  final ContractEntity insurancePolicy;
  final BrandEntity brand;
  final MachineImplementTypeEntity machineImplementType;
  final bool isExternal;
  final double hourMeter;
  final YearOfManufacture yearOfManufacture;
  final String place;
  final DepartmentEntity department;
  final DepartmentEntity subDepartment;
  final List<CostCenterEntity> costCenters;
  final String model;
  final String renavan;
  final String assetNumber;
  final String telemetryData;
  final String documentNumber;
  final String documentType;
  final double tankCapacity;
  final String dtInsuranceExpiration;
  final String dtAcquisition;
  final double acquisitionValue;
  final List<MachineImplementMaintenanceEntity> machineImplementMaintenances;
  final List<MultipartFileCustomEntity> attachments;
  final String attachmentNames;

  const MachineImplementEntity({
    required this.id,
    required this.description,
    required this.kilometers,
    required this.maintenanceHours,
    required this.maintenanceDate,
    required this.nickname,
    required this.chassis,
    required this.invoice,
    required this.insurancePolicy,
    required this.brand,
    required this.machineImplementType,
    required this.isExternal,
    required this.hourMeter,
    required this.yearOfManufacture,
    required this.place,
    required this.department,
    required this.subDepartment,
    required this.costCenters,
    required this.model,
    required this.renavan,
    required this.assetNumber,
    required this.telemetryData,
    required this.documentNumber,
    required this.documentType,
    required this.tankCapacity,
    required this.dtInsuranceExpiration,
    required this.dtAcquisition,
    required this.acquisitionValue,
    required this.machineImplementMaintenances,
    required this.attachments,
    required this.attachmentNames,
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
  final int value;
  final bool leap;

  const YearOfManufacture({
    required this.value,
    required this.leap,
  });

  @override
  List<Object?> get props => [
        value,
        leap,
      ];
}
