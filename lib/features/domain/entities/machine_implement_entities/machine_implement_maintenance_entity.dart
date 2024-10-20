import 'package:equatable/equatable.dart';

class MachineImplementMaintenanceEntity extends Equatable {
  final int id;
  final String date;
  final String description;
  final String componentCode;
  final String componentName;
  final double currentHourMeter;
  final double currentKilometer;
  final double requiredHourMeter;
  final double requiredKilometer;

  const MachineImplementMaintenanceEntity({
    required this.id,
    required this.date,
    required this.description,
    required this.componentCode,
    required this.componentName,
    required this.currentHourMeter,
    required this.currentKilometer,
    required this.requiredHourMeter,
    required this.requiredKilometer,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        description,
        componentCode,
        componentName,
        currentHourMeter,
        currentKilometer,
        requiredHourMeter,
        requiredKilometer,
      ];
}
