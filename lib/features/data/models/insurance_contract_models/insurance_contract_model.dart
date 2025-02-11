import 'dart:convert';

import 'package:new_ezagro_flutter/features/domain/entities/insurance_contract_entities/insurance_contract_entity.dart';

import '../contract_models/contract_item_model.dart';

class InsuranceContractModel extends InsuranceContractEntity {
  const InsuranceContractModel({
    required super.id,
    super.contract,
    super.externalCode,
    super.startDate,
    super.endDate,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    super.items,
  });

  String toJson() => json.encode(toMap());

  factory InsuranceContractModel.fromJson(String source) =>
      InsuranceContractModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() =>
      {
        'id': id,
        'contract': contract,
        'externalCode': externalCode,
        'startDate': startDate,
        'endDate': endDate,
        'description': description,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'items': items?.map((e) => (e as ContractItemModel).toMap()).toList(),
      };

  factory InsuranceContractModel.fromMap(Map<String, dynamic> map) =>
      InsuranceContractModel(
          id: map['id'],
          contract: map['contract'],
          externalCode: map['externalCode'],
          startDate: map['startDate'],
          endDate: map['endDate'],
          description: map['description'],
          createdAt: map['createdAt'],
          updatedAt: map['updatedAt'],
          deletedAt: map['deletedAt'],
          items: map['items'] == null ? null : List<ContractItemModel>.from(
              map['items']?.map((x) => ContractItemModel.fromMap(x))),
      );

  static List<InsuranceContractModel> fromListMap(List list) =>
      list.map((e) => InsuranceContractModel.fromMap(e)).toList();

  static List<InsuranceContractModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => InsuranceContractModel.fromMap(e))
          .toList();


}