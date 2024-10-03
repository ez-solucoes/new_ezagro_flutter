import 'dart:convert';
import '../../../domain/entities/contract_entities/contract_type_entity.dart';

class ContractTypeModel extends ContractTypeEntity {
  const ContractTypeModel({
    required super.id,
    required super.name,
    required super.description,
  });


  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
  };

  factory ContractTypeModel.fromMap(Map<String, dynamic> map) =>
      ContractTypeModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
      );

  String toJson() => json.encode(toMap());

  factory ContractTypeModel.fromJson(String source) =>
      ContractTypeModel.fromMap(json.decode(source));
}