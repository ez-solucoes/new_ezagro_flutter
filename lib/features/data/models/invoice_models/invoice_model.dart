import 'dart:convert';
import '../../../domain/entities/invoice_entities/invoice_entity.dart';
import '../company_models/company_model.dart';
import '../cost_center_models/cost_center_model.dart';
import '../issuer_recipient_models/issuer_recipient_model.dart';
import '../purchase_order_models/purchase_order_model.dart';
import '../rural_producer_models/rural_producer_model.dart';
import 'invoice_items_model.dart';
import 'invoice_payment_method_model.dart';


class InvoiceModel extends InvoiceEntity {
  const InvoiceModel({
    required super.id,
    required super.number,
    required super.series,
    required super.cfop,
    required super.numberLot,
    required super.settlement,
    required super.issuance,
    required super.total,
    required super.orderNumber,
    required super.dueDate,
    required super.natureOperation,
    required super.totalIpi,
    required super.totalIcms,
    required super.totalProducts,
    required super.company,
    required super.totalIcmsSt,
    required super.invoicePaymentMethods,
    required super.invoiceItems,
    required super.costCenters,
    required super.ruralProducers,
    required super.companies,
    required super.issuerRecipients,
    required super.purchaseOrders,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'number': number,
    'series': series,
    'cfop': cfop,
    'numberLot': numberLot,
    'settlement': settlement,
    'issuance': issuance,
    'total': total,
    'orderNumber': orderNumber,
    'dueDate': dueDate,
    'natureOperation': natureOperation,
    'totalIpi': totalIpi,
    'totalIcms': totalIcms,
    'totalProducts': totalProducts,
    'company': (company as CompanyModel).toMap(),'totalIcmsSt': totalIcmsSt,
    'invoicePaymentMethods': invoicePaymentMethods
        .map((e) => (e as InvoicePaymentMethodModel).toMap())
        .toList(),
    'invoiceItems':
    invoiceItems.map((e) => (e as InvoiceItemsModel).toMap()).toList(),
    'costCenters':
    costCenters.map((e) => (e as CostCenterModel).toMap()).toList(),
    'ruralProducers': ruralProducers
        .map((e) => (e as RuralProducerModel).toMap())
        .toList(),
    'companies': companies.map((e) => (e as CompanyModel).toMap()).toList(),
    'issuerRecipients': issuerRecipients
        .map((e) => (e as IssuerRecipientModel).toMap())
        .toList(),
    'purchaseOrders': purchaseOrders
        .map((e) => (e as PurchaseOrderModel).toMap())
        .toList(),
  };

  factory InvoiceModel.fromMap(Map<String, dynamic> map) => InvoiceModel(
    id: map['id'],
    number: map['number'],
    series: map['series'],
    cfop: map['cfop'],
    numberLot: map['numberLot'],
    settlement: map['settlement'],
    issuance: map['issuance'],
    total: map['total'],
    orderNumber: map['orderNumber'],
    dueDate: map['dueDate'],
    natureOperation: map['natureOperation'],
    totalIpi: map['totalIpi'],
    totalIcms: map['totalIcms'],
    totalProducts: map['totalProducts'],
    company: CompanyModel.fromMap(map['company']),
    totalIcmsSt: map['totalIcmsSt'],
    invoicePaymentMethods: List<InvoicePaymentMethodModel>.from(
        map['invoicePaymentMethods']
            ?.map((x) => InvoicePaymentMethodModel.fromMap(x))),
    invoiceItems: List<InvoiceItemsModel>.from(
        map['invoiceItems']?.map((x) => InvoiceItemsModel.fromMap(x))),
    costCenters: List<CostCenterModel>.from(
        map['costCenters']?.map((x) => CostCenterModel.fromMap(x))),
    ruralProducers: List<RuralProducerModel>.from(
        map['ruralProducers']?.map((x) => RuralProducerModel.fromMap(x))),
    companies: List<CompanyModel>.from(
        map['companies']?.map((x) => CompanyModel.fromMap(x))),
    issuerRecipients: List<IssuerRecipientModel>.from(
        map['issuerRecipients']?.map((x) => IssuerRecipientModel.fromMap(x))),
    purchaseOrders: List<PurchaseOrderModel>.from(
        map['purchaseOrders']?.map((x) => PurchaseOrderModel.fromMap(x))),
  );

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source));
}