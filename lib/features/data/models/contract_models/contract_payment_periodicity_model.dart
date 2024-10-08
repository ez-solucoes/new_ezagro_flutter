import 'dart:convert';
import '../../../domain/entities/contract_entities/contract_payment_periodicity_entity.dart';

class ContractPaymentPeriodicityModel extends ContractPaymentPeriodicityEntity {
  const ContractPaymentPeriodicityModel(
      super.percentageByDate, {
        required super.id,
        required super.name,
        required super.description,
      });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'percentageByDate': percentageByDate,
    'description': description,
  };

  factory ContractPaymentPeriodicityModel.fromMap(Map<String, dynamic> map) =>
      ContractPaymentPeriodicityModel(
        map['percentageByDate'],
        id: map['id'],
        name: map['name'],description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory ContractPaymentPeriodicityModel.fromJson(String source) =>
      ContractPaymentPeriodicityModel.fromMap(json.decode(source));

}