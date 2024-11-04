import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/group_entitites/group_entity.dart';

import '../client_entities/client_entity.dart';
import '../employee_entities/employee_entity.dart';
import '../outsource_entities/outsource_entity.dart';

class AuthenticationEntity extends Equatable {
  final int? id;
  final String? token;
  final String? username;
  final ClientEntity? client;
  final EmployeeEntity? employee;
  final OutsourceEntity? outsource;
  final CompanyEntity? company;
  final String? dtLastLogin;
  final bool? isLocked;
  final String? firstAccessVerification;
  final List<GroupEntity>? group;

  const AuthenticationEntity({
    this.id,
    this.token,
    this.client,
    this.username,
    this.employee,
    this.outsource,
    this.company,
    this.dtLastLogin,
    this.isLocked,
    this.firstAccessVerification,
    this.group,
  });

  @override
  List<Object?> get props => [
        id,
        token,
        client,
        username,
        employee,
        outsource,
        company,
        dtLastLogin,
        isLocked,
        firstAccessVerification,
        group,
      ];
}
