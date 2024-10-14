import 'package:equatable/equatable.dart';
import '../account_entities/account_entity.dart';
import '../contract_entities/contract_entity.dart';
import '../farm_entities/farm_entity.dart';
import 'common_association_of_rural_producer_entity.dart';

class RuralProducerEntity extends Equatable {
  final int id;
  final String dtBirth;
  final String stateRegistration;
  final String name;
  final String cpf;
  final List<AccountEntity> accounts;
  final List<ContractEntity> contracts;
  final List<String> attachmentNames;
  final List<CommonAssociationOfRuralProducerEntity> commonAssociation;
  final List<FarmEntity> farms;
  final bool active;

  const RuralProducerEntity({
    required this.id,
    required this.dtBirth,
    required this.stateRegistration,
    required this.name,
    required this.cpf,
    required this.accounts,
    required this.contracts,
    required this.attachmentNames,
    required this.commonAssociation,
    required this.farms,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        dtBirth,
        stateRegistration,
        name,
        cpf,
        accounts,
        contracts,
        attachmentNames,
        attachmentNames,
        commonAssociation,
        farms,
        active,
      ];
}
