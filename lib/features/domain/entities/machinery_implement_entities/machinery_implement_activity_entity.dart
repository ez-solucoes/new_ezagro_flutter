import 'package:equatable/equatable.dart';

import 'machinery_implement_entity.dart';

class MachineryImplementActivityEntity extends Equatable {
  final int id;
  final String? workHoursStart;
  final String? workHoursEnd;
  final String? mileageStart;
  final String? mileageEnd;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final MachineryImplementEntity? machineryImplement;

  const MachineryImplementActivityEntity({
    required this.id,
    this.workHoursStart,
    this.workHoursEnd,
    this.mileageStart,
    this.mileageEnd,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.machineryImplement,
  });

  @override
  List<Object?> get props => [
    id,
    workHoursStart,
    workHoursEnd,
    mileageStart,
    mileageEnd,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
    machineryImplement,
  ];

}