import 'package:equatable/equatable.dart';

import '../account_entities/account_entity.dart';
import '../address_entities/address_entity.dart';
import '../business_category_entities/business_category_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../email_entities/email_entity.dart';
import '../phone_entities/phone_entity.dart';
import 'company_type_entity.dart';

class CompanyHistoryEntity extends Equatable {
  final int id;
  final String name;
  final String cnpj;
  final bool exempt;
  final bool isAssigned;
  final bool ownedByUser;
  final String stateRegistration;
  final CompanyTypeEntity companyType;
  final PhoneEntity phone;
  final EmailEntity email;
  final AddressEntity address;
  final AccountEntity account;
  final List<BusinessCategoryEntity> businessCategories;
  final CostCenterEntity costCenter;

  const CompanyHistoryEntity({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.exempt,
    required this.isAssigned,
    required this.ownedByUser,
    required this.stateRegistration,
    required this.companyType,
    required this.phone,
    required this.email,
    required this.address,
    required this.account,
    required this.businessCategories,
    required this.costCenter,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        cnpj,
        exempt,
        isAssigned,
        ownedByUser,
        stateRegistration,
        companyType,
        phone,
        email,
        address,
        account,
        businessCategories,
        costCenter,
      ];
}
