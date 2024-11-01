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
    super.name,
    super.cnpj,
    super.exempt,
    super.isAssigned,
    super.ownedByUser,
    super.stateRegistration,
    super.companyType,
    super.phone,
    super.email,
    super.address,
    super.account,
    super.businessCategories,
    super.costCenter,
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
        'companyType': companyType == null
            ? null
            : (companyType as CompanyTypeModel).toMap(),
        'phone': phone == null ? null : (phone as PhoneModel).toMap(),
        'email': email == null ? null : (email as EmailModel).toMap(),
        'address': address == null ? null : (address as AddressModel).toMap(),
        'account': account == null ? null : (account as AccountModel).toMap(),
        'businessCategories': businessCategories
            ?.map((e) => (e as BusinessCategoryModel).toMap())
            .toList(),
        'costCenter':
            costCenter == null ? null : (costCenter as CostCenterModel).toMap(),
      };

  factory CompanyHistoryModel.fromMap(Map<String, dynamic> map) =>
      CompanyHistoryModel(
        id: map['id'],
        name: map['name'],
        cnpj: map['cnpj'],
        exempt: map['exempt'],
        isAssigned: map['isAssigned'],
        ownedByUser: map['ownedByUser'],
        stateRegistration: map['stateRegistration'],
        companyType: map['companyType'] == null
            ? null
            : CompanyTypeModel.fromMap(map['companyType']),
        phone: map['phone'] == null ? null : PhoneModel.fromMap(map['phone']),
        email: map['email'] == null ? null : EmailModel.fromMap(map['email']),
        address: map['address'] == null
            ? null
            : AddressModel.fromMap(map['address']),
        account: map['account'] == null
            ? null
            : AccountModel.fromMap(map['account']),
        businessCategories: map['businessCategories'] == null
            ? null
            : List<BusinessCategoryModel>.from(map['businessCategories']
                ?.map((x) => BusinessCategoryModel.fromMap(x))),
        costCenter: map['costCenter'] == null
            ? null
            : CostCenterModel.fromMap(map['costCenter']),
      );
}
