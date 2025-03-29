// ignore_for_file: unused_import

import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_activity_entity.dart';

import '../../../domain/entities/machinery_implement_entities/machinery_implement_entity.dart';

class MachineryImplementActivityModel extends MachineryImplementActivityEntity {
  const MachineryImplementActivityModel({
    required super.id,
    super.workHoursStart,
    super.workHoursEnd,
    super.mileageStart,
    super.mileageEnd,
    super.isActive,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.machineryImplement,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'workHoursStart': workHoursStart,
        'workHoursEnd': workHoursEnd,
        'mileageStart': mileageStart,
        'mileageEnd': mileageEnd,
        'isActive': isActive,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'machineryImplement': machineryImplement ,
      };

  factory MachineryImplementActivityModel.fromMap(Map<String, dynamic> map) =>
      MachineryImplementActivityModel(
        id: map['id'],
        workHoursStart: map['workHoursStart'],
        workHoursEnd: map['workHoursEnd'],
        mileageStart: map['mileageStart'],
        mileageEnd: map['mileageEnd'],
        isActive: map['isActive'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt'],
        deletedAt: map['deletedAt'],
        machineryImplement: map['machineryImplement'] == null ? null :  MachineryImplementModel.fromMap(map['machineryImplement']),
      );

  String toJson() => json.encode(toMap());

  factory MachineryImplementActivityModel.fromJson(String source) =>
      MachineryImplementActivityModel.fromMap(json.decode(source));
}
