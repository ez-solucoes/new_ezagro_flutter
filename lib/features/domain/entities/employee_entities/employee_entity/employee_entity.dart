import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/bank_account_entities/bank_account_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/department_entities/sub_department_entity/sub_department_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/dependent_entities/dependent_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_contract_type_entity/employee_contract_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/work_shift_entity/work_shift_entity.dart';
import '../../company_entities/company_entity.dart';
import '../../cost_center_entities/cost_center_entity.dart';
import '../../department_entities/department_entity/department_entity.dart';
import '../../farm_entities/farm_entity.dart';


class EmployeeEntity extends Equatable {
  final int id;
  final String? name;
  final String? birthDate;
  final String? cpf;
  final String? rg;
  final String? phoneNumber;
  final String? whatsappNumber;
  final String? email;
  final String? pisPasep;
  final String? motherName;
  final String? admissionDate;
  final String? dismissalDate;
  final String? dismissalReason;
  final String? position;
  final bool? isTrustPosition;
  final String? baseSalary;
  final String? unionCode;
  final String? observation;
  final bool? isActive;
  final String? addressZipCode;
  final String? addressStreet;
  final int? addressNumber;
  final String? addressCountry;
  final String? addressNeighborhood;
  final String? addressCity;
  final String? addressState;
  final String? addressComplement;
  final String? addressReference;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? healthInsuranceContract;
  final int? lifeInsuranceContract;
  final List<BankAccountEntity>? bankAccount;
  final FarmEntity? contractorFarm;
  final CompanyEntity? contractorCompany;
  final CostCenterEntity? contractorLocalCostCenter;
  final List<DependentEntity>? dependents;
  final EmployeeContractTypeEntity? contractType;
  final WorkShiftEntity? workShift;
  final List<dynamic>? salaryCompositions;
  final DepartmentEntity? department;
  final SubDepartmentEntity? subDepartment;

  const EmployeeEntity({
    required this.id,
    this.name,
    this.birthDate,
    this.cpf,
    this.rg,
    this.phoneNumber,
    this.whatsappNumber,
    this.email,
    this.pisPasep,
    this.motherName,
    this.admissionDate,
    this.dismissalDate,
    this.dismissalReason,
    this.position,
    this.isTrustPosition,
    this.baseSalary,
    this.unionCode,
    this.observation,
    this.isActive,
    this.addressZipCode,
    this.addressStreet,
    this.addressNumber,
    this.addressCountry,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
    this.addressComplement,
    this.addressReference,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.healthInsuranceContract,
    this.lifeInsuranceContract,
    this.bankAccount,
    this.contractorFarm,
    this.contractorCompany,
    this.contractorLocalCostCenter,
    this.dependents,
    this.contractType,
    this.workShift,
    this.salaryCompositions,
    this.department,
    this.subDepartment,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    birthDate,
    cpf,
    rg,
    phoneNumber,
    whatsappNumber,
    email,
    pisPasep,
    motherName,
    admissionDate,
    dismissalDate,
    dismissalReason,
    position,
    isTrustPosition,
    baseSalary,
    unionCode,
    observation,
    isActive,
    addressZipCode,
    addressStreet,
    addressNumber,
    addressCountry,
    addressNeighborhood,
    addressCity,
    addressState,
    addressComplement,
    addressReference,
    createdAt,
    updatedAt,
    deletedAt,
    healthInsuranceContract,
    lifeInsuranceContract,
    bankAccount,
    contractorFarm,
    contractorCompany,
    contractorLocalCostCenter,
    dependents,
    contractType,
    workShift,
    salaryCompositions,
    department,
    subDepartment,
  ];
}