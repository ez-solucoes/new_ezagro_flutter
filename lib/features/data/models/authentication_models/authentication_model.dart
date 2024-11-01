import 'dart:convert';
import '../../../domain/entities/authentication_entities/authentication_entity.dart';
import '../client_models/client_model.dart';
import '../company_models/company_model.dart';
import '../employee_models/employee_model.dart';
import '../group_models/group_model.dart';
import '../outsource_models/outsource_model.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel({
    required super.token,
    super.client,
    super.username,
    super.employee,
    super.outsource,
    super.company,
    super.dtLastLogin,
    super.isLocked,
    super.firstAccessVerification,
    super.group,
  });

  Map<String, dynamic> toMap() {return <String, dynamic>{
    'token': token,
    'username': username,
    'client': (client as ClientModel).toMap(),
    'employee': employee != null ? (employee as EmployeeModel).toMap() : null,
    'outsource': (outsource as OutsourceModel).toMap(),
    'company': (company as CompanyModel).toMap(),
    'dtLastLogin': dtLastLogin,
    'isLocked': isLocked,
    'firstAccessVerification': firstAccessVerification,
    'group': group,
  };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      token: map['token'] as String,
      username: map['username'] as String,
      client: map['client'] == null ? null : ClientModel.fromMap(map['client'] as Map<String, dynamic>),
      employee: map['employee'] != null
          ? EmployeeModel.fromMap(map['employee'] as Map<String, dynamic>)
          : null,
      outsource: map['outsource'] == null ? null : OutsourceModel.fromMap(map['outsource'] as Map<String, dynamic>),
      company: map['company'] == null ? null : CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
      dtLastLogin: map['dtLastLogin'] != null ? map['dtLastLogin'] as String : null,
      isLocked: map['isLocked'] as bool,
      firstAccessVerification: map['firstAccessVerification'] as String,
      group: map['group'] == null ? null : List<GroupModel>.from(
          map['group'].map((x) => GroupModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}