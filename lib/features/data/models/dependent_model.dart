import 'dart:convert';
import '../../domain/entities/dependent_entities/dependent_entity.dart';
import 'employee_models/employee_model.dart';

class DependentModel extends DependentEntity {
  const DependentModel({
    required super.id,
    required super.employee,
    required super.name,
    required super.relationship,
    required super.dateOfBirth,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'employee': (employee as EmployeeModel).toMap(),
    'name': name,
    'relationship': relationship,
    'dateOfBirth': dateOfBirth,
  };

  factory DependentModel.fromMap(Map<String, dynamic> map) => DependentModel(
    id: map['id'],
    employee: EmployeeModel.fromMap(map['employee']),
    name: map['name'],
    relationship: map['relationship'],
    dateOfBirth: map['dateOfBirth'],
  );

  String toJson() => json.encode(toMap());

  factory DependentModel.fromJson(String source) =>
      DependentModel.fromMap(json.decode(source));
}