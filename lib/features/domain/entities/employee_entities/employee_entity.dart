import 'package:equatable/equatable.dart';

import '../account_entities/account_entity.dart';

class EmployeeEntity extends Equatable {
  final int id;
  final AccountEntity account;

  const EmployeeEntity({required this.id, required this.account});

  @override
  List<Object?> get props => [
        id,
        account,
      ];
}
