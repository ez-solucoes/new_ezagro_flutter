import 'dart:convert';
import '../../../domain/entities/dependent_entities/dependent_entity.dart';

class DependentModel extends DependentEntity {
  const DependentModel({
    required super.id,
    super.name,
    super.birthDate,
    super.dependentTypeId,
    super.employeeId,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate,
      'dependentTypeId': dependentTypeId,
      'employeeId': employeeId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory DependentModel.fromMap(Map<String, dynamic> map) {
    return DependentModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      birthDate: map['birthDate'] as String?,
      dependentTypeId: map['dependentTypeId'] as int?,
      employeeId: map['employeeId'] as int?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory DependentModel.fromJson(String source) =>
      DependentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<List<String>> convertToTableList(List<DependentEntity> farms) {
    return farms.map((e) => [e.name ?? "", e.dependentTypeId?.toString() ?? "", e.birthDate ?? ""]).toList();
  }
}