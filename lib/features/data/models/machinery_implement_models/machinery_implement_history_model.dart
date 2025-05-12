import 'dart:convert';

import '../../../domain/entities/machinery_implement_entities/machinery_implement_history_entity.dart';
import '../local_time_model/local_time_model.dart';
import '../year_models/year_model.dart';


class MachineryImplementHistoryModel extends MachineryImplementHistoryEntity {
  const MachineryImplementHistoryModel({
    required super.machineImplementHistoryId,
    super.machineImplementId,
    super.isExternal,
    super.name,
    super.description,
    super.year,
    super.hourMeter,
    super.yearOfManufacture,
    super.place,
    super.chassis,
    super.maintenanceHours,
    super.kilometers,
    super.maintenanceDate,
    super.insurancePolicy,
    super.nickname,
  });

  Map<String, dynamic> toMap() => {
    'machineImplementHistoryId': machineImplementHistoryId,
    'machineImplementId': machineImplementId,
    'isExternal': isExternal,
    'name': name,
    'description': description,
    'year': year == null ? null :(year as YearModel).toMap(),
    'hourMeter': hourMeter,
    'yearOfManufacture': yearOfManufacture == null ? null : (yearOfManufacture as YearModel).toMap(),
    'place': place,
    'chassis': chassis,
    'maintenanceHours': maintenanceHours == null ? null : (maintenanceHours as LocalTimeModel).toMap(),
    'kilometers': kilometers,
    'maintenanceDate': maintenanceDate,
    'insurancePolicy': insurancePolicy,
    'nickname': nickname,
  };

  factory MachineryImplementHistoryModel.fromMap(Map<String, dynamic> map) =>
      MachineryImplementHistoryModel(
        machineImplementHistoryId: map['machineImplementHistoryId'],
        machineImplementId: map['machineImplementId'],
        isExternal: map['isExternal'],
        name: map['name'],
        description: map['description'],
        year: map['year'] == null ? null : YearModel.fromMap(map['year']),
        hourMeter: map['hourMeter'],
        yearOfManufacture: map['yearOfManufacture'] == null ? null : YearModel.fromMap(map['yearOfManufacture']),
        place: map['place'],
        chassis: map['chassis'],
        maintenanceHours: map['maintenanceHours'] == null ? null : LocalTimeModel.fromMap(map['maintenanceHours']),
        kilometers: map['kilometers'],
        maintenanceDate: map['maintenanceDate'],
        insurancePolicy: map['insurancePolicy'],
        nickname: map['nickname'],
      );

  String toJson() => json.encode(toMap());

  factory MachineryImplementHistoryModel.fromJson(String source) =>
      MachineryImplementHistoryModel.fromMap(json.decode(source));

}