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

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
    id: json['id'],
    agency: json['agency'],
    account: json['account'],
    bank: json['bank'],
    accountType: AccountTypeModel.fromJson(json['accountType']),
    pix: PixModel.fromJson(json['pix']),
    pixType: PixTypeModel.fromJson(json['pixType']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,'agency': agency,
    'account': account,
    'bank': bank,
    'accountType': (accountType as AccountTypeModel).toJson(),
    'pix': (pix as PixModel).toJson(),
    'pixType': (pixType as PixTypeModel).toJson(),
  };

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
}