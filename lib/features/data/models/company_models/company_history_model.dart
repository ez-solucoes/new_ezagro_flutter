import 'dart:convert';

import '../../../domain/entities/company_entities/company_history_entity.dart';
import '../account_models/account_model.dart';
import '../address_models/address_model.dart';
import '../business_category_models/business_category_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../email_model/email_model.dart';
import '../phone_models/phone_model.dart';
import 'company_type_model.dart';


class CompanyHistoryModel extends CompanyHistoryEntity {
  const CompanyHistoryModel({
    required super.id,
    required super.name,
    required super.cnpj,
    required super.exempt,
    required super.isAssigned,
    required super.ownedByUser,
    required super.stateRegistration,
    required super.companyType,
    required super.phone,
    required super.email,
    required super.address,
    required super.account,
    required super.businessCategories,
    required super.costCenter,
  });

  String toJson() => json.encode(toMap());

  factory CompanyHistoryModel.fromJson(String source) =>
      CompanyHistoryModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'cnpj': cnpj,
    'exempt': exempt,
    'isAssigned': isAssigned,
    'ownedByUser': ownedByUser,
    'stateRegistration': stateRegistration,
    'companyType': (companyType as CompanyTypeModel).toMap(),
    'phone': (phone as PhoneModel).toMap(),
    'email': (email as EmailModel).toMap(),
    'address': (address as AddressModel).toMap(),
    'account': (account as AccountModel).toMap(),
    'businessCategories': businessCategories
        .map((e) => (e as BusinessCategoryModel).toMap())
        .toList(),
    'costCenter': (costCenter as CostCenterModel).toMap(),
  };

  factory CompanyHistoryModel.fromMap(Map<String, dynamic> map) =>
      CompanyHistoryModel(
        id: map['id'],
        name:map['name'],
        cnpj: map['cnpj'],
        exempt: map['exempt'],
        isAssigned: map['isAssigned'],
        ownedByUser: map['ownedByUser'],
        stateRegistration: map['stateRegistration'],
        companyType: CompanyTypeModel.fromMap(map['companyType']),
        phone: PhoneModel.fromMap(map['phone']),
        email: EmailModel.fromMap(map['email']),
        address: AddressModel.fromMap(map['address']),
        account: AccountModel.fromMap(map['account']),
        businessCategories: List<BusinessCategoryModel>.from(map['businessCategories']
            ?.map((x) => BusinessCategoryModel.fromMap(x))),
        costCenter: CostCenterModel.fromMap(map['costCenter']),
      );
}