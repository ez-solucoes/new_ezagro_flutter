import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/bank_account_models/bank_account_model.dart';
import 'package:new_ezagro_flutter/features/data/models/company_models/company_model.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/dependent_models/dependent_model.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/salary_composition_model/salary_composition_model.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/work_shift_model/work_shift_model.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../domain/entities/dependent_entities/dependent_entity.dart';
import '../department_models/department_model/department_model.dart';
import '../department_models/sub_department_model/sub_department_model.dart';
import 'employee_contract_type_model/employee_contract_type_model.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required super.id,
    super.name,
    super.birthDate,
    super.cpf,
    super.rg,
    super.phoneNumber,
    super.whatsappNumber,
    super.email,
    super.pisPasep,
    super.motherName,
    super.admissionDate,
    super.dismissalDate,
    super.dismissalReason,
    super.position,
    super.isTrustPosition,
    super.baseSalary,
    super.unionCode,
    super.observation,
    super.isActive,
    super.addressZipCode,
    super.addressStreet,
    super.addressNumber,
    super.addressCountry,
    super.addressNeighborhood,
    super.addressCity,
    super.addressState,
    super.addressComplement,
    super.addressReference,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.healthInsuranceContract,
    super.lifeInsuranceContract,
    super.bankAccount,
    super.contractorFarm,
    super.contractorCompany,
    super.contractorLocalCostCenter,
    super.dependents,
    super.contractType,
    super.workShift,
    super.salaryCompositions,
    super.department,
    super.subDepartment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate,
      'cpf': cpf,
      'rg': rg,
      'phoneNumber': phoneNumber,
      'whatsappNumber': whatsappNumber,
      'email': email,
      'pisPasep': pisPasep,
      'motherName': motherName,
      'admissionDate': admissionDate,
      'dismissalDate': dismissalDate,
      'dismissalReason': dismissalReason,
      'position': position,
      'isTrustPosition': isTrustPosition,
      'baseSalary': baseSalary,
      'unionCode': unionCode,
      'observation': observation,
      'isActive': isActive,
      'addressZipCode': addressZipCode,
      'addressStreet': addressStreet,
      'addressNumber': addressNumber,
      'addressCountry': addressCountry,
      'addressNeighborhood': addressNeighborhood,
      'addressCity': addressCity,
      'addressState': addressState,
      'addressComplement': addressComplement,
      'addressReference': addressReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'healthInsuranceContract': healthInsuranceContract,
      'lifeInsuranceContract': lifeInsuranceContract,
      'bankAccount': bankAccount?.map((x) => (x as BankAccountModel).toMap()).toList(),
      'contractorFarm': contractorFarm == null ? null : (contractorFarm as FarmModel).toMap(),
      'contractorCompany': contractorCompany == null ? null : (contractorCompany as CompanyModel).toMap(),
      'contractorLocalCostCenter': contractorLocalCostCenter == null ? null : (contractorLocalCostCenter as CostCenterModel).toMap(),
      'dependents': dependents?.map((x) => (x as DependentModel).toMap()).toList(),
      'contractType': contractType == null ? null : (contractType as EmployeeContractTypeModel).toMap(),
      'workShift': workShift == null ? null : (workShift as WorkShiftModel).toMap(),
      'salaryCompositions': salaryCompositions?.map((x) => (x as SalaryCompositionModel).toMap()).toList(),
      'department': department == null ? null : (department as DepartmentModel).toMap(),
      'subDepartment': subDepartment == null ? null : (subDepartment as SubDepartmentModel).toMap(),
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      birthDate: map['birthDate'] as String?,
      cpf: map['cpf'] as String?,
      rg: map['rg'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      whatsappNumber: map['whatsappNumber'] as String?,
      email: map['email'] as String?,
      pisPasep: map['pisPasep'] as String?,
      motherName: map['motherName'] as String?,
      admissionDate: map['admissionDate'] as String?,
      dismissalDate: map['dismissalDate'] as String?,
      dismissalReason: map['dismissalReason'] as String?,
      position: map['position'] as String?,
      isTrustPosition: map['isTrustPosition'] as bool?,
      baseSalary: map['baseSalary'] as String?,
      unionCode: map['unionCode'] as String?,
      observation: map['observation'] as String?,
      isActive: map['isActive'] as bool?,
      addressZipCode: map['addressZipCode'] as String?,
      addressStreet: map['addressStreet'] as String?,
      addressNumber: map['addressNumber'] as int?,
      addressCountry: map['addressCountry'] as String?,
      addressNeighborhood: map['addressNeighborhood'] as String?,
      addressCity: map['addressCity'] as String?,
      addressState: map['addressState'] as String?,
      addressComplement: map['addressComplement'] as String?,
      addressReference: map['addressReference'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      healthInsuranceContract: map['healthInsuranceContract'] as int?,
      lifeInsuranceContract: map['lifeInsuranceContract'] as int?,
      bankAccount: map['bankAccounts'] != null ? (map['bankAccounts'] as List).map((e) => BankAccountModel.fromMap(e)).toList() : null,
      contractorFarm: map['contractorFarm'] != null
          ? FarmModel.fromMap(map['contractorFarm'] as Map<String, dynamic>)
          : null,
      contractorCompany: map['contractorCompany'] != null
          ? CompanyModel.fromMap(map['contractorCompany'] as Map<String, dynamic>)
          : null,
      contractorLocalCostCenter: map['contractorLocalCostCenter'] != null
          ? CostCenterModel.fromMap(map['contractorLocalCostCenter'] as Map<String, dynamic>)
          : null,
      dependents: map['dependents'] != null
          ? List<DependentEntity>.from(map['dependents']?.map((x) => DependentModel.fromMap(x as Map<String, dynamic>)))
          : null,
      contractType: map['contractType'] != null
          ? EmployeeContractTypeModel.fromMap(map['contractType'] as Map<String, dynamic>)
          : null,
      workShift: map['workShift'] != null
          ? WorkShiftModel.fromMap(map['workShift'] as Map<String, dynamic>)
          : null,
      salaryCompositions: map['salaryCompositions'] != null
          ? List.from(map['salaryCompositions']?.map((x) => SalaryCompositionModel.fromMap(x as Map<String, dynamic>)))
          : null,
      department: map['department'] != null
          ? DepartmentModel.fromMap(map['department'] as Map<String, dynamic>)
          : null,
      subDepartment: map['subDepartment'] != null
          ? SubDepartmentModel.fromMap(map['subDepartment'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<List<String>> convertToTableList(List<EmployeeEntity> employees) {
    return employees.map((e) => [e.id.toString(), e.name ?? "", e.position ?? ""]).toList();
  }
}