import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/issuer_recipient_entities/issuer_recipient_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/purchaseOrderEntities/purchase_order_item_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/rural_producer_entities/rural_producer_entity.dart';

class PurchaseOrderEntity extends Equatable {
  final int id;
  final List<PurchaseOrderItemEntity> purchaseOrderItems;
  final CompanyEntity issuerCompany;
  final RuralProducerEntity issuerRuralProducer;
  final CompanyEntity recipient;
  final IssuerRecipientEntity issuerRecipient;
  final String paymentMethod;
  final String paymentDate;
  final String status;

  const PurchaseOrderEntity({
    required this.id,
    required this.purchaseOrderItems,
    required this.issuerCompany,
    required this.issuerRuralProducer,
    required this.recipient,
    required this.issuerRecipient,
    required this.paymentMethod,
    required this.paymentDate,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        purchaseOrderItems,
        issuerCompany,
        issuerRuralProducer,
        recipient,
        issuerRecipient,
        paymentMethod,
        paymentDate,
        status,
      ];
}
