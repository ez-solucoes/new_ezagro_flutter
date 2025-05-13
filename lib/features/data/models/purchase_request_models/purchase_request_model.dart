import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_status_model.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_step_model.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_type_model.dart';

import '../../../domain/entities/purchase_request_entities/purchase_request_entity.dart';
import '../company_models/company_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../delivery_location_models/delivery_location_model.dart';
import '../employee_models/employee_model.dart';
import '../farm_models/farm_model.dart';
import '../payment_method_models/payment_method_model.dart';
import '../request_item_models/request_item_model.dart';

class PurchaseRequestModel extends PurchaseRequestEntity {
  const PurchaseRequestModel({
    super.id,
    super.quotationExpirationDate,
    super.paymentDate,
    super.notes,
    super.isUrgent,
    super.hasErrorInOrderItem,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.type,
    super.step,
    super.status,
    required super.farm,
    super.costCenter,
    super.paymentMethod,
    super.deliveryLocation,
    super.companies,
    super.requestItems,
    super.responsibleEmployee,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quotationExpirationDate': quotationExpirationDate,
      'paymentDate': paymentDate,
      'notes': notes,
      'isUrgent': isUrgent,
      'hasErrorInOrderItem': hasErrorInOrderItem,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'type': type,
      'step': step,
      'status': status,
      'farm': farm,
      'costCenter': costCenter,
      'responsibleEmployee': responsibleEmployee,
      'paymentMethod': paymentMethod,
      'deliveryLocation': deliveryLocation,
      'companies': companies,
      'requestItems': requestItems,
    };
  }

  factory PurchaseRequestModel.fromMap(Map<String, dynamic> map) {
    return PurchaseRequestModel(
      id: map['id'] as int?,
      quotationExpirationDate: map['quotationExpirationDate'] as String?,
      paymentDate: map['paymentDate'] as String?,
      notes: map['notes'] as String?,
      isUrgent: map['isUrgent'] as bool?,
      hasErrorInOrderItem: map['hasErrorInOrderItem'] as bool?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
      type: map['type'] == null ? null : PurchaseRequestTypeModel.fromMap(map['type']),
      step: map['step'] == null ? null : PurchaseRequestStepModel.fromMap(map['step']),
      status: map['status'] == null ? null : PurchaseRequestStatusModel.fromMap(map['status']),
      farm: FarmModel.fromMap(map['farm']),
      costCenter: map['costCenter'] == null ? null : CostCenterModel.fromMap(map['costCenter']),
      responsibleEmployee: map['responsibleEmployee'] == null ? null : EmployeeModel.fromMap(map['responsibleEmployee']),
      paymentMethod: map['paymentMethod'] == null ? null : PaymentMethodModel.fromMap(map['paymentMethod']),
      deliveryLocation: map['deliveryLocation'] == null ? null : DeliveryLocationModel.fromMap(map['deliveryLocation']) as DeliveryLocationModel?,
      companies: map['companies'] == null ? null : List<CompanyModel>.from(map['companies'].map((x) => CompanyModel.fromMap(x))),
      requestItems: map['requestItems'] == null ? null : List<RequestItemModel>.from(map['requestItems'].map((x) => RequestItemModel.fromMap(x))),

    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseRequestModel.fromJson(String source) =>
      PurchaseRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}