import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/service_order_entities/service_order_employee_entity.dart';

import '../employee_models/employee_model.dart';

class ServiceOrderEmployeeModel extends ServiceOrderEmployeeEntity {
  const ServiceOrderEmployeeModel({
    required super.id,
    super.isResponsible,
    super.isLeader,
    super.isExecutor,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.employee,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isResponsible': isResponsible,
      'isLeader': isLeader,
      'isExecutor': isExecutor,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'employee': employee,
    };
  }

  factory ServiceOrderEmployeeModel.fromMap(Map<String, dynamic> map) {
    return ServiceOrderEmployeeModel(
      id: map['id'] as int,
      isResponsible: map['isResponsible'] as bool?,
      isLeader: map['isLeader'] as bool?,
      isExecutor: map['isExecutor'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      employee: map['employee'] == null ? null : EmployeeModel.fromMap(map['employee']),
    );
  }

  factory ServiceOrderEmployeeModel.fromEntity(ServiceOrderEmployeeEntity entity){
    return ServiceOrderEmployeeModel(
      id: entity.id,
      isResponsible: entity.isResponsible,
      isLeader: entity.isLeader,
      isExecutor: entity.isExecutor,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      employee: entity.employee,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceOrderEmployeeModel.fromJson(String source) =>
      ServiceOrderEmployeeModel.fromMap(json.decode(source));
}