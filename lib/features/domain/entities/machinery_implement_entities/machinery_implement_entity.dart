import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/insurance_contract_entities/insurance_contract_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../department_entities/department_entity/department_entity.dart';
import '../department_entities/sub_department_entity/sub_department_entity.dart';
import 'machinery_implement_type_entity.dart';

class MachineryImplementEntity extends Equatable {
  final int? id;
  final bool? isMachinery;
  final String? nickname;
  final String? description;
  final String? brandName;
  final String? modelName;
  final int? fabricationYear;
  final String? renavam;
  final String? assetNumber;
  final String? licensePlate;
  final String? chassisNumber;
  final String? workHours;
  final int? mileage;
  final int? tankCapacity;
  final int? invoiceNumber;
  final String? acquisitionDate;
  final String?acquisitionValue;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final MachineryImplementTypeEntity? type;
  final CostCenterEntity? costCenter;
  final DepartmentEntity? department;
  final SubDepartmentEntity? subDepartment;
  final List<InsuranceContractEntity>? insuranceContracts;

  const MachineryImplementEntity({
    this.id,
    this.isMachinery,
    this.nickname,
    this.description,
    this.brandName,
    this.modelName,
    this.fabricationYear,
    this.renavam,
    this.assetNumber,
    this.licensePlate,
    this.chassisNumber,
    this.workHours,
    this.mileage,
    this.tankCapacity,
    this.invoiceNumber,
    this.acquisitionDate,
    this.acquisitionValue,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.type,
    this.costCenter,
    this.department,
    this.subDepartment,
    this.insuranceContracts,
  });

  @override
  List<Object?> get props => [
    id,
    isMachinery,
    nickname,
    description,
    brandName,
    modelName,
    fabricationYear,
    renavam,
    assetNumber,
    licensePlate,
    chassisNumber,
    workHours,
    mileage,
    tankCapacity,
    invoiceNumber,
    acquisitionDate,
    acquisitionValue,
    createdAt,
    updatedAt,
    deletedAt,
    type,
    costCenter,
    department,
    subDepartment,
    insuranceContracts,
      ];
}

