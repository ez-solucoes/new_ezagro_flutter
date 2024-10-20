import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

class ServiceOrderListModel extends ServiceOrderListEntity {
  const ServiceOrderListModel(
      {required super.id,
      required super.activityName,
      required super.farmName,
      required super.employeeName,
      required super.status,
      required super.activityStart,
      required super.activityEnd,
      required super.costCenterName});

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
        costCenterName: map['costCenterName'] as String);
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
        costCenterName: entity.costCenterName);
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
