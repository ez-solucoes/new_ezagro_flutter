import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/account_entities/account_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/address_entities/address_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/phone_entities/phone_entity.dart';

import '../business_category_entities/business_category_entity.dart';
import '../contract_entities/contract_entity.dart';
import 'company_type_entity.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String name;
  final String cnpj;
  final String cpf;
  final bool isServiceProvider;
  final bool exempt;
  final bool isAssigned;
  final bool ownedByUser;
  final String stateRegistration;
  final CompanyTypeEntity companyType;
  final PhoneEntity phone;
  final AddressEntity address;
  final AccountEntity account;
  final List<BusinessCategoryEntity> businessCategories;
  final CostCenterEntity costCenter;
  final List<ContractEntity> contracts;

  const CompanyEntity({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.cpf,
    required this.isServiceProvider,
    required this.exempt,
    required this.isAssigned,
    required this.ownedByUser,
    required this.stateRegistration,
    required this.companyType,
    required this.phone,
    required this.address,
    required this.account,
    required this.businessCategories,
    required this.costCenter,
    required this.contracts,
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
      ];
}
