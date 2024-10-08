import 'package:equatable/equatable.dart';
import '../account_entities/account_entity.dart';
import '../address_entities/address_entity.dart';
import '../business_category_entities/business_category_entity.dart';
import '../contract_entities/contract_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../multipart_file_custom_entities/multipart_file_custom_entity.dart';
import '../phone_entities/phone_entity.dart';
import '../shareholding_structure_entities/shareholding_structure_entity.dart';
import 'company_type_entity.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String? name;
  final String? cnpj;
  final String? cpf;
  final bool? isServiceProvider;
  final bool? exempt;
  final bool? isAssigned;
  final bool? ownedByUser;
  final String? stateRegistration;
  final CompanyTypeEntity? companyType;
  final PhoneEntity? phone;
  final AddressEntity? address;
  final AccountEntity? account;
  final List<BusinessCategoryEntity>? businessCategories;
  final CostCenterEntity? costCenter;
  final List<ContractEntity>? contracts;
  final List<MultipartFileCustomEntity>? attachments;
  final String? attachmentNames;
  final List<ShareHoldingStructureEntity>? shareholdingStructure;
  final String? paymentMethod;

  const CompanyEntity({
    required this.id,
    this.name,
    this.cnpj,
    this.cpf,
    this.isServiceProvider,
    this.exempt,
    this.isAssigned,
    this.ownedByUser,
    this.stateRegistration,
    this.companyType,
    this.phone,
    this.address,
    this.account,
    this.businessCategories,
    this.costCenter,
    this.contracts,
    this.attachments,
    this.attachmentNames,
    this.shareholdingStructure,
    this.paymentMethod,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cnpj,
        cpf,
        isServiceProvider,
        exempt,
        isAssigned,
        ownedByUser,
        stateRegistration,
        companyType,
        phone,
        address,
        account,
        businessCategories,
        costCenter,
        contracts,
        attachments,
        attachmentNames,
        shareholdingStructure,
        paymentMethod,
      ];
}
