import 'package:equatable/equatable.dart';

import '../employee_entities/employee_entity/employee_entity.dart';

class ServiceOrderEmployeeEntity extends Equatable {
  final int id;
  final bool? isResponsible;
  final bool? isLeader;
  final bool? isExecutor;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final EmployeeEntity? employee;

  const ServiceOrderEmployeeEntity({
    required this.id,
    this.isResponsible,
    this.isLeader,
    this.isExecutor,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.employee,
  });

  @override
  List<Object?> get props => [
    id,
    isResponsible,
    isLeader,
    isExecutor,
    createdAt,
    updatedAt,
    deletedAt,
    employee,
  ];
}
