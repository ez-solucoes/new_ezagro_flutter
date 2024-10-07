import 'dart:convert';
import '../../../domain/entities/company_entities/company_entity.dart';
import '../account_models/account_model.dart';
import '../address_models/address_model.dart';
import '../business_category_models/business_category_model.dart';
import '../contract_models/contract_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../multipart_file_custom_model/multipart_file_custom_model.dart';
import '../phone_models/phone_model.dart';
import '../shareholding_structure_models/shareholding_structure_model.dart';
import 'company_type_model.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
    required super.cnpj,
    required super.cpf,
    required super.isServiceProvider,
    required super.exempt,
    required super.isAssigned,
    required super.ownedByUser,
    required super.stateRegistration,
    required super.companyType,
    required super.phone,
    required super.address,
    required super.account,
    required super.businessCategories,
    required super.costCenter,
    required super.contracts,
    required super.attachments,
    required super.attachmentNames,
    required super.shareholdingStructure,
    required super.paymentMethod,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'cnpj': cnpj,
    'cpf': cpf,
    'isServiceProvider': isServiceProvider,
    'exempt': exempt,
    'isAssigned': isAssigned,
    'ownedByUser': ownedByUser,
    'stateRegistration': stateRegistration,
    'companyType': (companyType as CompanyTypeModel).toMap(),
    'phone': (phone as PhoneModel).toMap(),
    'address': (address as AddressModel).toMap(),
    'account': (account as AccountModel).toMap(),
    'businessCategories': businessCategories
        .map((e) => (e as BusinessCategoryModel).toMap())
        .toList(),
    'costCenter': (costCenter as CostCenterModel).toMap(),
    'contracts': contracts.map((e) => (e as ContractModel).toMap()).toList(),
    'attachments':
    attachments.map((e) => (e as MultipartFileCustomModel).toMap()).toList(),
    'attachmentNames': attachmentNames,
    'shareholdingStructure': shareholdingStructure
        .map((e) => (e as ShareHoldingStructureModel).toMap())
        .toList(),
    'paymentMethod': paymentMethod,
  };

  factory CompanyModel.fromMap(Map<String, dynamic> map) => CompanyModel(
    id: map['id'],
    name: map['name'],
    cnpj: map['cnpj'],
    cpf: map['cpf'],
    isServiceProvider: map['isServiceProvider'],
    exempt: map['exempt'],
    isAssigned: map['isAssigned'],
    ownedByUser: map['ownedByUser'],
    stateRegistration: map['stateRegistration'],
    companyType: CompanyTypeModel.fromMap(map['companyType']),
    phone: PhoneModel.fromMap(map['phone']),
    address: AddressModel.fromMap(map['address']),
    account: AccountModel.fromMap(map['account']),
    businessCategories: List<BusinessCategoryModel>.from(
        map['businessCategories']?.map((x) => BusinessCategoryModel.fromMap(x))),
    costCenter: CostCenterModel.fromMap(map['costCenter']),
    contracts: List<ContractModel>.from(
        map['contracts']?.map((x) => ContractModel.fromMap(x))),
    attachments: List<MultipartFileCustomModel>.from(
        map['attachments']?.map((x) => MultipartFileCustomModel.fromMap(x))),
    attachmentNames: map['attachmentNames'],
    shareholdingStructure: List<ShareHoldingStructureModel>.from(
        map['shareholdingStructure']
            ?.map((x) => ShareHoldingStructureModel.fromMap(x))),
    paymentMethod: map['paymentMethod'],
  );

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));

}