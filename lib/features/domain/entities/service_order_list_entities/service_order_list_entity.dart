import 'package:equatable/equatable.dart';

class ServiceOrderListEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String? expectedStartDate;
  final String activityName;

  const ServiceOrderListEntity({
      required this.id,
      required this.name,
      required this.status,
      required this.expectedStartDate,
      required this.activityName
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    expectedStartDate,
    activityName
  ];

}
