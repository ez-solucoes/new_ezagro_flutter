import 'dart:convert';

import '../../../domain/entities/contract_entities/contract_item_entity.dart';
import 'contract_model.dart';
import 'contract_payment_method_model.dart';
import 'contract_payment_periodicity_model.dart';

class ContractItemModel extends ContractItemEntity {
  const ContractItemModel({
    required super.id,
    required super.name,
    required super.unitPrice,
    required super.dtPayment,
    required super.paymentMethod,
    required super.paymentPeriodicity,
    required super.contract,
  });

  String toJson() => json.encode(toMap());

  factory ContractItemModel.fromJson(String source) =>
      ContractItemModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'unitPrice': unitPrice,
        'dtPayment': dtPayment,
        'paymentMethod': paymentMethod == null ? null : (paymentMethod as ContractPaymentMethodModel).toMap(),
        'paymentPeriodicity':
            paymentPeriodicity == null ? null : (paymentPeriodicity as ContractPaymentPeriodicityModel).toMap(),
        'contract': contract == null ? null : (contract as ContractModel).toMap(),
      };

  factory ContractItemModel.fromMap(Map<String, dynamic> map) =>
      ContractItemModel(
        id: map['id'],
        name: map['name'],
        unitPrice: map['unitPrice'],
        dtPayment: map['dtPayment'],
        paymentMethod: map['paymentMethod'] == null ? null : ContractPaymentMethodModel.fromMap(map['paymentMethod']),
        paymentPeriodicity:
        map['paymentPeriodicity'] == null ? null : ContractPaymentPeriodicityModel.fromMap(map['paymentPeriodicity']),
        contract: map['contract'] == null ? null : ContractModel.fromMap(map['contract']),
      );
}
