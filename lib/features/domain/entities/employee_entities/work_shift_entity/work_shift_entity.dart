import 'package:equatable/equatable.dart';

class WorkShiftEntity extends Equatable {
  final int id;
  final String? name;
  final String? slug;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const WorkShiftEntity({
    required this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}