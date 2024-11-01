import 'dart:convert';

import '../../../domain/entities/machine_implement_entities/machine_implement_maintenance_entity.dart';

class MachineImplementMaintenanceModel
    extends MachineImplementMaintenanceEntity {
  const MachineImplementMaintenanceModel({
    required super.id,
    super.date,
    super.description,
    super.componentCode,
    super.componentName,
    super.currentHourMeter,
    super.currentKilometer,
    super.requiredHourMeter,
    super.requiredKilometer,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'date': date,
        'description': description,
        'componentCode': componentCode,
        'componentName': componentName,
        'currentHourMeter': currentHourMeter,
        'currentKilometer': currentKilometer,
        'requiredHourMeter': requiredHourMeter,
        'requiredKilometer': requiredKilometer,
      };

  factory MachineImplementMaintenanceModel.fromMap(Map<String, dynamic> map) =>
      MachineImplementMaintenanceModel(
        id: map['id'],
        date: map['date'],
        description: map['description'],
        componentCode: map['componentCode'],
        componentName:map['componentName'],
        currentHourMeter: map['currentHourMeter'],
        currentKilometer: map['currentKilometer'],
        requiredHourMeter: map['requiredHourMeter'] != null && map['requiredHourMeter'] is int
            ? (map['requiredHourMeter'] as int).toDouble()
            : map['requiredHourMeter'],
        requiredKilometer: map['requiredKilometer'] != null && map['requiredKilometer'] is int
            ? (map['requiredKilometer'] as int).toDouble()
            : map['requiredKilometer'],
      );

  String toJson() => json.encode(toMap());

  factory MachineImplementMaintenanceModel.fromJson(String source) =>
      MachineImplementMaintenanceModel.fromMap(json.decode(source));
}
