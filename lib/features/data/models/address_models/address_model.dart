import 'dart:convert';

import '../../../domain/entities/address_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    required super.country,
    required super.referenceLocation,
    required super.state,
    required super.cep,
    required super.city,
    required super.neighbourhood,
    required super.street,
    required super.number,required super.complement,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'country': country,
    'referenceLocation': referenceLocation,
    'state': state,
    'cep': cep,
    'city': city,
    'neighbourhood': neighbourhood,
    'street': street,
    'number': number,
    'complement': complement,
  };

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
    id: map['id'],
    country: map['country'],
    referenceLocation: map['referenceLocation'],
    state: map['state'],
    cep: map['cep'],
    city: map['city'],
    neighbourhood: map['neighbourhood'],
    street: map['street'],
    number: map['number'],
    complement: map['complement'],
  );

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}