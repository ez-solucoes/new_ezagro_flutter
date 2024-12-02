import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/bank_account_entities/bank_account_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/financial_institution_entities/financial_institution_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pix_entities/pix_entity.dart';

class BankAccountEntity extends Equatable {
  final int id;
  final String? agencyNumber;
  final String? accountNumber;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final BankAccountTypeEntity?  bankAccountType;
  final FinancialInstitutionEntity? financialInstitution;
  final List<PixEntity>? pix;
  final int? companyId;
  final int? employeeId;

  const BankAccountEntity({
    required this.id,
    this.agencyNumber,
    this.accountNumber,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.bankAccountType,
    this.financialInstitution,
    this.pix,
    this.companyId,
    this.employeeId,
  });

  @override
  List<Object?> get props => [
    id,
    agencyNumber,
    accountNumber,
    createdAt,
    updatedAt,
    deletedAt,
    bankAccountType,
    financialInstitution,
    pix,
    companyId,
    employeeId,
  ];
}
