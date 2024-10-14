import 'dart:convert';
import '../../../domain/entities/invoice_entities/invoice_payment_method_entity.dart';
import '../account_models/account_model.dart';
import 'invoice_payment_method_type_model.dart';


class InvoicePaymentMethodModel extends InvoicePaymentMethodEntity {
  const InvoicePaymentMethodModel({
    required super.number,
    required super.dueDate,
    required super.value,
    required super.invoicePaymentMethodType,
    required super.account,
  });

  String toJson() => json.encode(toMap());

  factory InvoicePaymentMethodModel.fromJson(String source) =>
      InvoicePaymentMethodModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'number': number,
    'dueDate': dueDate,
    'value': value,
    'invoicePaymentMethodType':
    (invoicePaymentMethodType as InvoicePaymentMethodTypeModel).toMap(),
    'account': (account as AccountModel).toMap(),
  };

  factory InvoicePaymentMethodModel.fromMap(Map<String, dynamic> map) =>
      InvoicePaymentMethodModel(
        number: map['number'],
        dueDate: map['dueDate'],
        value: map['value'],
        invoicePaymentMethodType:
        InvoicePaymentMethodTypeModel.fromMap(map['invoicePaymentMethodType']),
        account: AccountModel.fromMap(map['account']),
      );
}