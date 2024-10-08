import 'dart:convert';
import '../../../domain/entities/invoice_entities/invoice_payment_method_type_entity.dart';

class InvoicePaymentMethodTypeModel extends InvoicePaymentMethodTypeEntity {
  const InvoicePaymentMethodTypeModel({
    required super.id,
    required super.description,
    required super.name,
  });

  String toJson() => json.encode(toMap());

  factory InvoicePaymentMethodTypeModel.fromJson(String source) =>
      InvoicePaymentMethodTypeModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'name': name,
  };

  factory InvoicePaymentMethodTypeModel.fromMap(Map<String, dynamic> map) =>
      InvoicePaymentMethodTypeModel(
        id: map['id'],
        description: map['description'],
        name: map['name'],
      );
}