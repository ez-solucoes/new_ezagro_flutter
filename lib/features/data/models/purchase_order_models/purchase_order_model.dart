import 'dart:convert';

import '../../../domain/entities/purchase_order_entities/purchase_order_entity.dart';
import '../company_models/company_model.dart';
import '../issuer_recipient_models/issuer_recipient_model.dart';
import '../rural_producer_models/rural_producer_model.dart';
import 'purchase_order_item_model.dart';

class PurchaseOrderModel extends PurchaseOrderEntity {
  const PurchaseOrderModel({
    required super.id,
    required super.purchaseOrderItems,
    required super.issuerCompany,
    required super.issuerRuralProducer,
    required super.recipient,
    required super.issuerRecipient,
    required super.paymentMethod,
    required super.paymentDate,
    required super.status,
  });

  String toJson() => json.encode(toMap());

  factory PurchaseOrderModel.fromJson(String source) =>
      PurchaseOrderModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'purchaseOrderItems': purchaseOrderItems
            .map((e) => (e as PurchaseOrderItemModel).toMap())
            .toList(),
        'issuerCompany': (issuerCompany as CompanyModel).toMap(),
        'issuerRuralProducer':
            (issuerRuralProducer as RuralProducerModel).toMap(),
        'recipient': (recipient as CompanyModel).toMap(),
        'issuerRecipient': (issuerRecipient as IssuerRecipientModel).toMap(),
        'paymentMethod': paymentMethod,
        'paymentDate': paymentDate,
        'status': status,
      };

  factory PurchaseOrderModel.fromMap(Map<String, dynamic> map) =>
      PurchaseOrderModel(
        id: map['id'],
        purchaseOrderItems: List<PurchaseOrderItemModel>.from(
            map['purchaseOrderItems']
                ?.map((x) => PurchaseOrderItemModel.fromMap(x))),
        issuerCompany: CompanyModel.fromMap(map['issuerCompany']),
        issuerRuralProducer:
            RuralProducerModel.fromMap(map['issuerRuralProducer']),
        recipient: CompanyModel.fromMap(map['recipient']),
        issuerRecipient: IssuerRecipientModel.fromMap(map['issuerRecipient']),
        paymentMethod: map['paymentMethod'],
        paymentDate: map['paymentDate'],
        status: map['status'],
      );
}
