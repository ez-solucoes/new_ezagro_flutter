
import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

class ServiceOrderListModel extends ServiceOrderListEntity {

  @override
  final int id;

  @override
  final String activityName;

  @override
  final String farmName;

  @override
  final String employeeName;

  @override
  final String status;

  @override
  final String activityStart;

  @override
  final String activityEnd;

  @override
  final String costCenterName;

  const ServiceOrderListModel({
    required this.id,
    required this.activityName,
    required this.farmName,
    required this.employeeName,
    required this.status,
    required this.activityStart,
    required this.activityEnd,
    required this.costCenterName
  }) : super(
    id: id,
    activityName: activityName,
    farmName: farmName,
    employeeName: employeeName,
    status: status,
    activityStart: activityStart,
    activityEnd: activityEnd,
    costCenterName: costCenterName
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'activityName': activityName,
      'farmName': farmName,
      'employeeName': employeeName,
      'status': status,
      'activityStart': activityStart,
      'activityEnd': activityEnd,
      'costCenterName': costCenterName
    };
  }

  factory ServiceOrderListModel.fromMap(Map<String, dynamic> map) {
    return ServiceOrderListModel(
      id: map['id'] as int,
      activityName: map['activityName'] as String,
      farmName: map['farmName'] as String,
      employeeName: map['employeeName'] as String,
      status: map['status'] as String,
      activityStart: map['activityStart'] as String,
      activityEnd: map['activityEnd'] as String,
      costCenterName: map['costCenterName'] as String
    );
  }
  
  factory ServiceOrderListModel.fromEntity(ServiceOrderListEntity entity) {
    return ServiceOrderListModel(
        id: entity.id,
        activityName: entity.activityName,
        farmName: entity.farmName,
        employeeName: entity.employeeName,
        status: entity.status,
        activityStart: entity.activityStart,
        activityEnd: entity.activityEnd,
        costCenterName: entity.costCenterName
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceOrderListModel.fromJson(String source) =>
      ServiceOrderListModel.fromMap(json.decode(source));

  static List<ServiceOrderListModel> fromListMap(List list) =>
      list.map((e) => ServiceOrderListModel.fromMap(e)).toList();

  static List<ServiceOrderListModel> fromJsonList(String source) =>
      (json.decode(source) as List)
        .map((e) => ServiceOrderListModel.fromMap(e))
        .toList();
}