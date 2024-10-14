import 'dart:convert';
import '../../../domain/entities/rural_producer_entities/rural_producer_entity.dart';
import '../account_models/account_model.dart';
import '../contract_models/contract_model.dart';
import '../farm_models/farm_model.dart';
import 'common_association_of_rural_producer_model.dart';

class RuralProducerModel extends RuralProducerEntity {
  const RuralProducerModel({
    required super.id,
    required super.dtBirth,
    required super.stateRegistration,
    required super.name,
    required super.cpf,
    required super.accounts,
    required super.contracts,
    required super.attachmentNames,
    required super.commonAssociation,
    required super.farms,
    required super.active,
  });

  String toJson() => json.encode(toMap());

  factory RuralProducerModel.fromJson(String source) =>
      RuralProducerModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {'id': id,
    'dtBirth': dtBirth,
    'stateRegistration': stateRegistration,
    'name': name,
    'cpf': cpf,
    'accounts': accounts.map((e) => (e as AccountModel).toMap()).toList(),
    'contracts': contracts.map((e) => (e as ContractModel).toMap()).toList(),
    'attachmentNames': attachmentNames,
    'commonAssociation':
    commonAssociation.map((e) => (e as CommonAssociationOfRuralProducerModel).toMap()).toList(),
    'farms': farms.map((e) => (e as FarmModel).toMap()).toList(),
    'active': active,
  };

  factory RuralProducerModel.fromMap(Map<String, dynamic> map) =>
      RuralProducerModel(
        id: map['id'],
        dtBirth: map['dtBirth'],
        stateRegistration: map['stateRegistration'],
        name: map['name'],
        cpf: map['cpf'],
        accounts: List<AccountModel>.from(
            map['accounts']?.map((x) => AccountModel.fromMap(x))),
        contracts:List<ContractModel>.from(
            map['contracts']?.map((x) => ContractModel.fromMap(x))),
        attachmentNames: List<String>.from(map['attachmentNames']),
        commonAssociation: List<CommonAssociationOfRuralProducerModel>.from(
            map['commonAssociation']
                ?.map((x) => CommonAssociationOfRuralProducerModel.fromMap(x))),
        farms: List<FarmModel>.from(map['farms']?.map((x) => FarmModel.fromMap(x))),
        active: map['active'],
      );
}