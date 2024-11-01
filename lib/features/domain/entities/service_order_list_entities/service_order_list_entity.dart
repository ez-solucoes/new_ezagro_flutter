import 'package:equatable/equatable.dart';

class ServiceOrderListEntity extends Equatable {
  final int id;
  final String? activityName;
  final String? farmName;
  final String? employeeName;
  final String? status;
  final String? activityStart;
  final String? activityEnd;
  final String? costCenterName;

  const ServiceOrderListEntity({
      required this.id,
      this.activityName,
      this.farmName,
      this.employeeName,
      this.status,
      this.activityStart,
      this.activityEnd = "",
      this.costCenterName
  });

  @override
  List<Object?> get props => [
    id,
    activityName,
    farmName,
    employeeName,
    status,
    activityStart,
    activityEnd,
    costCenterName
  ];

}
