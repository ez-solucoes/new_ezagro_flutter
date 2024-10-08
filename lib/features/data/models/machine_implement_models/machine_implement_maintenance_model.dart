import 'dart:convert';
import '../../../domain/entities/machine_implement_entities/machine_implement_maintenance_entity.dart';

class MachineImplementMaintenanceModel extends MachineImplementMaintenanceEntity {
  const MachineImplementMaintenanceModel({
    required super.id,
    required super.date,
    required super.description,
    required super.componentCode,
    required super.componentName,
    required super.currentHourMeter,
    required super.currentKilometer,
    required super.requiredHourMeter,
    required super.requiredKilometer,
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
        componentName: map['componentName'],
        currentHourMeter: map['currentHourMeter'],
        currentKilometer: map['currentKilometer'],
        requiredHourMeter: map['requiredHourMeter'],
        requiredKilometer: map['requiredKilometer'],
      );

  String toJson() => json.encode(toMap());

  factory MachineImplementMaintenanceModel.fromJson(String source) =>
      MachineImplementMaintenanceModel.fromMap(json.decode(source));
}
