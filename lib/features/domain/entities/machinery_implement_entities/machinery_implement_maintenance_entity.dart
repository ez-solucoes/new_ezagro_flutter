import 'package:equatable/equatable.dart';

class MachineryImplementMaintenanceEntity extends Equatable{
  final int id;
  final String? date;
  final String? description;
  final String? componentCode;
  final String? componentName;
  final double? currentHourMeter;
  final double? currentKilometer;
  final double? requiredHourMeter;
  final double? requiredKilometer;

  const MachineryImplementMaintenanceEntity({
    required this.id,
    this.date,
    this.description,
    this.componentCode,
    this.componentName,
    this.currentHourMeter,
    this.currentKilometer,
    this.requiredHourMeter,
    this.requiredKilometer,
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