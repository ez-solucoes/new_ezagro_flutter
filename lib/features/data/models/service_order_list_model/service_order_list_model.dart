
import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/service_order_list_entities/service_order_list_entity.dart';

class ServiceOrderListModel extends ServiceOrderListEntity {

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String expectedStartDate;
  @override
  final String activityName;

  const ServiceOrderListModel({
    required this.id,
    required this.name,
    required this.status,
    required this.expectedStartDate,
    required this.activityName
  }) : super(
      id: id,
      name: name,
      status: status,
      expectedStartDate: expectedStartDate,
      activityName: activityName
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'expectedStartDate': expectedStartDate,
      'activityName': activityName,
    };
  }

  factory ServiceOrderListModel.fromMap(Map<String, dynamic> map) {
    return ServiceOrderListModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      expectedStartDate: map['expectedStartDate'] as String,
      activityName: map['activityName'] as String
    );
  }
  
  factory ServiceOrderListModel.fromEntity(ServiceOrderListEntity entity) {
    return ServiceOrderListModel(
        id: entity.id,
        name: entity.name,
        status: entity.status,
        expectedStartDate: entity.expectedStartDate,
        activityName: entity.activityName);
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