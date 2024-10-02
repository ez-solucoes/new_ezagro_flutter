
import 'dart:convert';

import '../../../domain/entities/account_entities/account_entity.dart';
import '../pix_models/pix_model.dart';
import '../pix_models/pix_type_model.dart';
import 'account_type_model.dart';

class AccountModel extends AccountEntity {
  const AccountModel(
      {
        required super.id,
        required super.agency,
        required super.account,
        required super.bank,
        required super.accountType,
        required super.pix,
        required super.pixType
      });

  Map<String, dynamic> toMap() => {
    'id': id,
    'agency': agency,
    'account': account,
    'bank': bank,
    'accountType': (accountType as AccountTypeModel).toMap(),
    'pix': (pix as PixModel).toMap(),
    'pixType': (pixType as PixTypeModel).toMap(),
  };

  factory AccountModel.fromMap(Map<String, dynamic> map) => AccountModel(
    id: map['id'],
    agency: map['agency'],
    account: map['account'],
    bank: map['bank'],
    accountType: AccountTypeModel.fromMap(map['accountType']),
    pix: PixModel.fromMap(map['pix']),
    pixType: PixTypeModel.fromMap(map['pixType']),
  );

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));
}