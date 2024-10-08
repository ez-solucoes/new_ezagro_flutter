import 'package:equatable/equatable.dart';

import '../local_time_entities/local_time_entity.dart';
import '../year_entities/year_entity.dart';

class MachineImplementHistoryEntity extends Equatable {
  final int machineImplementHistoryId;
  final int machineImplementId;
  final bool isExternal;
  final String name;
  final String description;
  final YearEntity year;
  final String hourMeter;
  final YearEntity yearOfManufacture;
  final String place;
  final String chassis;
  final LocalTimeEntity maintenanceHours;
  final int kilometers;
  final String maintenanceDate;
  final String insurancePolicy;
  final String nickname;

  const MachineImplementHistoryEntity({
    required this.machineImplementHistoryId,
    required this.machineImplementId,
    required this.isExternal,
    required this.name,
    required this.description,
    required this.year,
    required this.hourMeter,
    required this.yearOfManufacture,
    required this.place,
    required this.chassis,
    required this.maintenanceHours,
    required this.kilometers,
    required this.maintenanceDate,
    required this.insurancePolicy,
    required this.nickname,
  });

  @override
  List<Object?> get props => [
        machineImplementHistoryId,
        machineImplementId,
        isExternal,
        name,
        description,
        year,
        hourMeter,
        yearOfManufacture,
        place,
        chassis,
        maintenanceHours,
        kilometers,
        maintenanceDate,
        insurancePolicy,
        nickname,
      ];
}
