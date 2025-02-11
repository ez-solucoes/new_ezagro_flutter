import 'dart:convert';

import '../../../domain/entities/machinery_implement_entities/machinery_implement_maintenance_entity.dart';

class MachineryImplementMaintenanceModel
    extends MachineryImplementMaintenanceEntity {
  const MachineryImplementMaintenanceModel({
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

  factory MachineryImplementMaintenanceModel.fromMap(Map<String, dynamic> map) =>
      MachineryImplementMaintenanceModel(
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

  factory MachineryImplementMaintenanceModel.fromJson(String source) =>
      MachineryImplementMaintenanceModel.fromMap(json.decode(source));
}
