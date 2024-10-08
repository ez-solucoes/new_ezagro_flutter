import 'dart:convert';

import '../../../domain/entities/machine_implement_entities/machine_implement_history_entity.dart';
import '../local_time_model/local_time_model.dart';
import '../year_models/year_model.dart';


class MachineImplementHistoryModel extends MachineImplementHistoryEntity {
  const MachineImplementHistoryModel({
    required super.machineImplementHistoryId,
    required super.machineImplementId,
    required super.isExternal,
    required super.name,
    required super.description,
    required super.year,
    required super.hourMeter,
    required super.yearOfManufacture,
    required super.place,
    required super.chassis,
    required super.maintenanceHours,
    required super.kilometers,
    required super.maintenanceDate,
    required super.insurancePolicy,
    required super.nickname,
  });

  Map<String, dynamic> toMap() => {
    'machineImplementHistoryId': machineImplementHistoryId,
    'machineImplementId': machineImplementId,
    'isExternal': isExternal,
    'name': name,
    'description': description,
    'year': (year as YearModel).toMap(),
    'hourMeter': hourMeter,
    'yearOfManufacture': (yearOfManufacture as YearModel).toMap(),
    'place': place,
    'chassis': chassis,
    'maintenanceHours': (maintenanceHours as LocalTimeModel).toMap(),
    'kilometers': kilometers,
    'maintenanceDate': maintenanceDate,
    'insurancePolicy': insurancePolicy,
    'nickname': nickname,
  };

  factory MachineImplementHistoryModel.fromMap(Map<String, dynamic> map) =>
      MachineImplementHistoryModel(
        machineImplementHistoryId: map['machineImplementHistoryId'],
        machineImplementId: map['machineImplementId'],
        isExternal: map['isExternal'],
        name: map['name'],
        description: map['description'],
        year: YearModel.fromMap(map['year']),
        hourMeter: map['hourMeter'],
        yearOfManufacture: YearModel.fromMap(map['yearOfManufacture']),
        place: map['place'],
        chassis: map['chassis'],
        maintenanceHours: LocalTimeModel.fromMap(map['maintenanceHours']),
        kilometers: map['kilometers'],
        maintenanceDate: map['maintenanceDate'],
        insurancePolicy: map['insurancePolicy'],
        nickname: map['nickname'],
      );

  String toJson() => json.encode(toMap());

  factory MachineImplementHistoryModel.fromJson(String source) =>
      MachineImplementHistoryModel.fromMap(json.decode(source));

}