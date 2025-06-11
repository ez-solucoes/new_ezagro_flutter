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
    super.items, // Este 'items' aqui já deve ser List<ItemsModel>? se for usado no construtor
  });

  // Existing methods...
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
      // Ao converter para Map, se 'items' for List<ItemsModel>, chame toMap() em cada item
      'items': (items as List<ItemsModel>?)?.map((item) => item.toMap()).toList(),
      // Nota: Se 'items' puder ser List<ItemsEntity> ou List<ItemsModel> dependendo de onde vem,
      // a lógica de toMap pode precisar de um check de tipo ou um metodo toMap na Entity também,
      // ou garantir que items SEMPRE será List<ItemsModel> ao criar o Model.
    };
  }


  factory SendPurchaseRequestModel.fromMap(Map<String, dynamic> map) { // Use Map<String, dynamic>
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
      // Note: 'companyIds' from map might be List<dynamic>, need to cast/map
      companyIds: (map['companyIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      // Note: 'items' from map might be List<dynamic>, need to map to ItemsModel
      items: (map['items'] as List<dynamic>?)?.map((e) => ItemsModel.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }


  String toJson() => json.encode(toMap());

  factory SendPurchaseRequestModel.fromJson(String source) =>
      SendPurchaseRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);


  // NOVO: Factory constructor para criar um SendPurchaseRequestModel a partir de um SendPurchaseRequestEntity
  factory SendPurchaseRequestModel.fromEntity(SendPurchaseRequestEntity entity) {
    // Converte a lista de ItemsEntity para uma lista de ItemsModel
    List<ItemsModel>? itemsModel;
    if (entity.items != null) {
      itemsModel = entity.items!.map((item) {
        // Aqui usamos o factory fromEntity da classe ItemsModel
        // para garantir que cada item na nova lista seja um ItemsModel.
        // É crucial que 'item' seja pelo menos um ItemsEntity para que isso funcione.
        // Se 'item' já for um ItemsModel, fromEntity ainda funcionará copiando suas propriedades.
        return ItemsModel.fromEntity(item);
      }).toList();
    }

    return SendPurchaseRequestModel(
      quotationExpirationDate: entity.quotationExpirationDate,
      paymentDate: entity.paymentDate,
      notes: entity.notes,
      isUrgent: entity.isUrgent,
      typeId: entity.typeId,
      deliveryLocationId: entity.deliveryLocationId,
      farmId: entity.farmId,
      costCenterId: entity.costCenterId,
      responsibleEmployeeId: entity.responsibleEmployeeId,
      paymentMethodId: entity.paymentMethodId,
      companyIds: entity.companyIds,
      items: itemsModel, // Usa a lista de Models convertida
    );
  }
}