import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/email_entities/email_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/outsource_entities/outsourceStatusEntity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/outsource_entities/outsource_type_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/phone_entities/phone_entity.dart';

import '../address_entities/address_entity.dart';

class OutsourceEntity extends Equatable {
  final int id;
  final AddressEntity address;
  final OutsourceEntity account;
  final PhoneEntity phone;
  final EmailEntity email;
  final OutsourceTypeEntity type;
  final OutsourceStatusEntity status;
  final bool lessee;
  final String cnpj;
  final String cpf;
  final String name;
  final String contract;

 const OutsourceEntity({
    required this.id,
    required this.address,
    required this.account,
    required this.phone,
    required this.email,
    required this.type,
    required this.status,
    required this.lessee,
    required this.cnpj,
    required this.cpf,
    required this.name,
    required this.contract,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}