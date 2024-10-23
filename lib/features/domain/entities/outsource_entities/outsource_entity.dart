import 'package:equatable/equatable.dart';

import '../address_entities/address_entity.dart';
import '../email_entities/email_entity.dart';
import '../phone_entities/phone_entity.dart';
import 'outsource_status_entity.dart';
import 'outsource_type_entity.dart';

class OutsourceEntity extends Equatable {
  final int id;
  final AddressEntity? address;
  final OutsourceEntity? account;
  final PhoneEntity? phone;
  final EmailEntity? email;
  final OutsourceTypeEntity? type;
  final OutsourceStatusEntity? status;
  final bool? lessee;
  final String? cnpj;
  final String? cpf;
  final String? name;
  final String? contract;

 const OutsourceEntity({
    required this.id,
    this.address,
    this.account,
    this.phone,
    this.email,
    this.type,
    this.status,
    this.lessee,
    this.cnpj,
    this.cpf,
    this.name,
    this.contract,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}