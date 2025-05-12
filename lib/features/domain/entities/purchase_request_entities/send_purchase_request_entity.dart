import 'package:equatable/equatable.dart';

import '../items_entities/items_entity.dart';

class SendPurchaseRequestEntity extends Equatable {
  final String? quotationExpirationDate;
  final String? paymentDate;
  final String? notes;
  final bool? isUrgent;
  final int? typeId;
  final int? deliveryLocationId;
  final int? farmId;
  final int? costCenterId;
  final int? responsibleEmployeeId;
  final int? paymentMethodId;
  final List<int>? companyIds;
  final List<ItemsEntity>? items;

  const SendPurchaseRequestEntity({
    this.quotationExpirationDate,
    this.paymentDate,
    this.notes,
    this.isUrgent,
    this.typeId,
    this.deliveryLocationId,
    this.farmId,
    this.costCenterId,
    this.responsibleEmployeeId,
    this.paymentMethodId,
    this.companyIds,
    this.items,
  });

  @override
  List<Object?> get props => [
        quotationExpirationDate,
        paymentDate,
        notes,
        isUrgent,
        typeId,
        deliveryLocationId,
        farmId,
        costCenterId,
        responsibleEmployeeId,
        paymentMethodId,
        companyIds,
        items,
      ];
}
