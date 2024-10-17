import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';

import '../client_entities/client_entity.dart';
import '../employee_entities/employee_entity.dart';
import '../outsource_entities/outsource_entity.dart';

class AuthenticationEntity extends Equatable {
  final String token;
  final String username;
  final ClientEntity client;
  final EmployeeEntity? employee;
  final OutsourceEntity outsource;
  final CompanyEntity company;
  final String? dtLastLogin;
  final bool isLocked;
  final String firstAccessVerification;
  final List<String> group;

  const AuthenticationEntity({
    required this.token,
    required this.client,
    required this.username,
    required this.employee,
    required this.outsource,
    required this.company,
    required this.dtLastLogin,
    required this.isLocked,
    required this.firstAccessVerification,
    required this.group,
  });

  @override
  List<Object?> get props => [
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
