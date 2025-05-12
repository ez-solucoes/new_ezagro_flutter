import 'package:equatable/equatable.dart';

class SubDepartmentEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const SubDepartmentEntity({
    required this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}