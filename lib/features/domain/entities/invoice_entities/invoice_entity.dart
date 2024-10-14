import 'package:equatable/equatable.dart';

import '../company_entities/company_entity.dart';
import '../cost_center_entities/cost_center_entity.dart';
import '../issuer_recipient_entities/issuer_recipient_entity.dart';
import '../purchase_order_entities/purchase_order_entity.dart';
import '../rural_producer_entities/rural_producer_entity.dart';
import 'invoice_items_entity.dart';
import 'invoice_payment_method_entity.dart';

class InvoiceEntity extends Equatable {
  final int id;
  final int number;
  final int series;
  final int cfop;
  final double numberLot;
  final bool settlement;
  final String issuance;
  final double total;
  final double orderNumber;
  final String dueDate;
  final String natureOperation;
  final double totalIpi;
  final double totalIcms;
  final double totalProducts;
  final CompanyEntity company;
  final double totalIcmsSt;
  final List<InvoicePaymentMethodEntity> invoicePaymentMethods;
  final List<InvoiceItemsEntity> invoiceItems;
  final List<CostCenterEntity> costCenters;
  final List<RuralProducerEntity> ruralProducers;
  final List<CompanyEntity> companies;
  final List<IssuerRecipientEntity> issuerRecipients;
  final List<PurchaseOrderEntity> purchaseOrders;

  const InvoiceEntity({
    required this.id,
    required this.number,
    required this.series,
    required this.cfop,
    required this.numberLot,
    required this.settlement,
    required this.issuance,
    required this.total,
    required this.orderNumber,
    required this.dueDate,
    required this.natureOperation,
    required this.totalIpi,
    required this.totalIcms,
    required this.totalProducts,
    required this.company,
    required this.totalIcmsSt,
    required this.invoicePaymentMethods,
    required this.invoiceItems,
    required this.costCenters,
    required this.ruralProducers,
    required this.companies,
    required this.issuerRecipients,
    required this.purchaseOrders,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        series,
        cfop,
        numberLot,
        settlement,
        issuance,
        total,
        orderNumber,
        dueDate,
        natureOperation,
        totalIpi,
        totalIcms,
        totalProducts,
        company,
        totalIcmsSt,
        invoicePaymentMethods,
        invoiceItems,
        costCenters,
        ruralProducers,
        companies,
        issuerRecipients,
        purchaseOrders,
      ];
}
