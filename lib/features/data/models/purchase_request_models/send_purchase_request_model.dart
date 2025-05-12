import 'dart:convert';

import 'package:new_ezagro_flutter/features/data/models/items_models/items_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/send_purchase_request_entity.dart';

class SendPurchaseRequestModel extends SendPurchaseRequestEntity {
  const SendPurchaseRequestModel({
    super.quotationExpirationDate,
    super.paymentDate,
    super.notes,
    super.isUrgent,
    super.typeId,
    super.deliveryLocationId,
    super.farmId,
    super.costCenterId,
    super.responsibleEmployeeId,
    super.paymentMethodId,
    super.companyIds,
    super.items,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'quotationExpirationDate': quotationExpirationDate,
      'paymentDate': paymentDate,
      'notes': notes,
      'isUrgent': isUrgent,
      'typeId': typeId,
      'deliveryLocationId': deliveryLocationId,
      'farmId': farmId,
      'costCenterId': costCenterId,
      'responsibleEmployeeId': responsibleEmployeeId,
      'paymentMethodId': paymentMethodId,
      'companyIds': companyIds,
      'items': items,
    };
  }

  factory SendPurchaseRequestModel.fromMap(map) {
    return SendPurchaseRequestModel(
      quotationExpirationDate: map['quotationExpirationDate'] as String?,
      paymentDate: map['paymentDate'] as String?,
      notes: map['notes'] as String?,
      isUrgent: map['isUrgent'] as bool?,
      typeId: map['typeId'] as int?,
      deliveryLocationId: map['deliveryLocationId'] as int?,
      farmId: map['farmId'] as int?,
      costCenterId: map['costCenterId'] as int?,
      responsibleEmployeeId: map['responsibleEmployeeId'] as int?,
      paymentMethodId: map['paymentMethodId'] as int?,
      companyIds: map['companyIds'] as List<int>?,
      items: map['items'] as List<ItemsModel>?,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendPurchaseRequestModel.fromJson(String source) =>
      SendPurchaseRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}