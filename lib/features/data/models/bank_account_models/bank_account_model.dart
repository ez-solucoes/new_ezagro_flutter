import 'dart:convert';
import 'package:new_ezagro_flutter/features/data/models/bank_account_models/bank_account_type_model.dart';
import 'package:new_ezagro_flutter/features/data/models/financial_institution_models/financial_institution_model.dart';
import '../../../domain/entities/bank_account_entities/bank_account_entity.dart';
import '../pix_models/pix_model.dart';

class BankAccountModel extends BankAccountEntity {
  const BankAccountModel({
    required super.id,
    super.agencyNumber,
    super.accountNumber,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.bankAccountType,
    super.financialInstitution,
    super.pix,
    super.pixList,
    super.companyId,
    super.employeeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'agencyNumber': agencyNumber,
      'accountNumber': accountNumber,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'bankAccountType': (bankAccountType as BankAccountTypeModel).toMap(),
      'financialInstitution': (financialInstitution as FinancialInstitutionModel).toMap(),
      'pix': pix?.map((x) => (x as PixModel).toMap()).toList(),
      'pixList': pixList?.map((x) => (x as PixModel).toMap()).toList(),
      'companyId': companyId,
      'employeeId': employeeId,
    };
  }

  factory BankAccountModel.fromMap(Map<String, dynamic> map) {
    return BankAccountModel(
      id: map['id'] as int,
      agencyNumber: map['agencyNumber'] as String?,
      accountNumber: map['accountNumber'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      bankAccountType: map['bankAccountType'] != null ? BankAccountTypeModel.fromMap(map['bankAccountType'] as Map<String, dynamic>) : null,
      financialInstitution: map['financialInstitution'] != null ? FinancialInstitutionModel.fromMap(map['financialInstitution'] as Map<String, dynamic>) : null,
      pix: map['pix'] != null ? List<PixModel>.from(map['pix']?.map((x) => PixModel.fromMap(x as Map<String, dynamic>))) : null,
      pixList: map['pixList'] != null ? List<PixModel>.from(map['pixList']?.map((x) => PixModel.fromMap(x as Map<String, dynamic>))) : null,
      companyId: map['companyId'] as int?,
      employeeId: map['employeeId'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccountModel.fromJson(String source) =>
      BankAccountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}