import 'package:equatable/equatable.dart';

import '../pix_entities/pix_entity.dart';
import '../pix_entities/pix_type_entity.dart';
import 'account_type_entity.dart';

class AccountEntity extends Equatable {
  final int id;
  final String? agency;
  final String? account;
  final String? bank;
  final AccountTypeEntity? accountType;
  final List<PixEntity>? pix;
  final PixTypeEntity? pixType;

  const AccountEntity(
      { required this.id,
       this.agency,
       this.account,
       this.bank,
       this.accountType,
       this.pix,
       this.pixType});

  @override
  List<Object?> get props => [
        id,
        agency,
        account,
        bank,
        accountType,
        pix,
        pixType,
      ];
}
