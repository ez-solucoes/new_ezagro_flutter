import 'dart:convert';
import '../../../domain/entities/employee_entities/employee_status_entity.dart';


class EmployeeStatusModel extends EmployeeStatusEntity {
  const EmployeeStatusModel({
    required super.id,
    required super.name,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,'active': active,
  };

  factory EmployeeStatusModel.fromMap(Map<String, dynamic> map) =>
      EmployeeStatusModel(
        id: map['id'],
        name: map['name'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory EmployeeStatusModel.fromJson(String source) =>
      EmployeeStatusModel.fromMap(json.decode(source));
}