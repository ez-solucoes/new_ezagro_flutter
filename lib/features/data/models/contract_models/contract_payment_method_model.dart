import 'dart:convert';

import '../../../domain/entities/contract_entities/contract_payment_method_entity.dart';

class ContractPaymentMethodModel extends ContractPaymentMethodEntity {
  const ContractPaymentMethodModel({
    required super.id,
    required super.name,
    required super.description,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };

  factory ContractPaymentMethodModel.fromMap(Map<String, dynamic> map) =>
      ContractPaymentMethodModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory ContractPaymentMethodModel.fromJson(String source) =>
      ContractPaymentMethodModel.fromMap(json.decode(source));
}
