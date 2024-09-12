import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/account_entities/account_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/address_entities/address_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/authentication_entities/authentication_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/phone_entities/phone_entity.dart';

import '../business_category_entities/business_category_entity.dart';
import 'company_type_entity.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String name;
  final String cnpj;
  final String cpf;
  final bool isServiceProvider;
  final bool exempt;
  final bool isAssigned;
  final bool ownerdByUser;
  final String stateRegistration;
  final CompanyTypeEntity companyType;
  final PhoneEntity phone;
  final AddressEntity address;
  final AccountEntity account;
  final List<BusinessCategoryEntity> businessCategories;
  final CostCenterEntity costCenter;
  final List<ContractEntity> contracts





  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
