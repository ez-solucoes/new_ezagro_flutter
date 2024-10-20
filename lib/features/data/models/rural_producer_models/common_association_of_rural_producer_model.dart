import 'dart:convert';

import '../../../domain/entities/rural_producer_entities/common_association_of_rural_producer_entity.dart';

class CommonAssociationOfRuralProducerModel
    extends CommonAssociationOfRuralProducerEntity {
  const CommonAssociationOfRuralProducerModel({
    required super.id,
    required super.name,
    required super.cpf,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'cpf': cpf,
        'active': active,
      };

  factory CommonAssociationOfRuralProducerModel.fromMap(
          Map<String, dynamic> map) =>
      CommonAssociationOfRuralProducerModel(
        id: map['id'],
        name: map['name'],
        cpf: map['cpf'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory CommonAssociationOfRuralProducerModel.fromJson(String source) =>
      CommonAssociationOfRuralProducerModel.fromMap(json.decode(source));
}
