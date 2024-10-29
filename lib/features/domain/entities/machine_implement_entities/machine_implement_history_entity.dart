import 'package:equatable/equatable.dart';

import '../local_time_entities/local_time_entity.dart';
import '../year_entities/year_entity.dart';

class MachineImplementHistoryEntity extends Equatable {
  final int? machineImplementHistoryId;
  final int? machineImplementId;
  final bool? isExternal;
  final String? name;
  final String? description;
  final YearEntity? year;
  final String? hourMeter;
  final YearEntity? yearOfManufacture;
  final String? place;
  final String? chassis;
  final LocalTimeEntity? maintenanceHours;
  final int? kilometers;
  final String? maintenanceDate;
  final String? insurancePolicy;
  final String? nickname;

  const MachineImplementHistoryEntity({
    this.machineImplementHistoryId,
    this.machineImplementId,
    this.isExternal,
    this.name,
    this.description,
    this.year,
    this.hourMeter,
    this.yearOfManufacture,
    this.place,
    this.chassis,
    this.maintenanceHours,
    this.kilometers,
    this.maintenanceDate,
    this.insurancePolicy,
    this.nickname,
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
