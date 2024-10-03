import 'dart:convert';
import '../../../domain/entities/employee_entities/employee_entity.dart';
import '../account_models/account_model.dart';

class EmployeeModel extends EmployeeEntity {
  const EmployeeModel({
    required super.id,
    required super.account,
  });

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'account': (account as AccountModel).toMap(),
  };

  factory EmployeeModel.fromMap(Map<String, dynamic> map) => EmployeeModel(
    id: map['id'],
    account: AccountModel.fromMap(map['account']),
  );
}