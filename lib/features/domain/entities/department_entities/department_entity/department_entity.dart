import 'package:equatable/equatable.dart';

import '../sub_department_entity/sub_department_entity.dart';

class DepartmentEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<SubDepartmentEntity>? subDepartments;

  const DepartmentEntity({
    required this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.subDepartments,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    createdAt,
    updatedAt,
    deletedAt,
    subDepartments,
  ];
}