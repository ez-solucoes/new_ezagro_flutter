import 'dart:convert';

import '../../../domain/entities/outsource_entities/outsource_entity.dart';
import '../address_models/address_model.dart';
import '../email_model/email_model.dart';
import '../phone_models/phone_model.dart';
import 'outsource_status_model.dart';
import 'outsource_type_model.dart';

class OutsourceModel extends OutsourceEntity {
  const OutsourceModel({
    required super.id,
    super.address,
    super.account,
    super.phone,
    super.email,
    super.type,
    super.status,
    super.lessee,
    super.cnpj,
    super.cpf,
    super.name,
    super.contract,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'address': (address as AddressModel).toMap(),
      'account': (account as OutsourceModel).toMap(),
      'phone': (phone as PhoneModel).toMap(),
      'email': (email as EmailModel).toMap(),
      'type': (type as OutsourceTypeModel).toMap(),
      'status': (status as OutsourceStatusModel).toMap(),
      'lessee': lessee,
      'cnpj': cnpj,
      'cpf': cpf,
      'name': name,
      'contract': contract,
    };
  }

  factory OutsourceModel.fromMap(Map<String, dynamic> map) {
    return OutsourceModel(
      id: map['id'] as int,
      address: map['address'] == null
          ? null
          : AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      account: map['account'] == null
          ? null
          : OutsourceModel.fromMap(map['account'] as Map<String, dynamic>),
      phone: map['phone'] == null
          ? null
          : PhoneModel.fromMap(map['phone'] as Map<String, dynamic>),
      email: map['email'] == null
          ? null
          : EmailModel.fromMap(map['email'] as Map<String, dynamic>),
      type: map['type'] == null
          ? null
          : OutsourceTypeModel.fromMap(map['type'] as Map<String, dynamic>),
      status: map['status'] == null
          ? null
          : OutsourceStatusModel.fromMap(map['status'] as Map<String, dynamic>),
      lessee: map['lessee'] as bool,
      cnpj: map['cnpj'] as String,
      cpf: map['cpf'] as String,
      name: map['name'] as String,
      contract: map['contract'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OutsourceModel.fromJson(String source) =>
      OutsourceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
