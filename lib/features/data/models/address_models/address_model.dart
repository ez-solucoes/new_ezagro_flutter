import 'dart:convert';

import '../../../domain/entities/address_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.id,
    super.country,
    super.referenceLocation,
    super.state,
    super.cep,
    super.city,
    super.neighbourhood,
    super.street,
    super.number,
    super.complement,
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
