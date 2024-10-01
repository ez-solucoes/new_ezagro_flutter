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

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json['id'],
    country: json['country'],
    referenceLocation: json['referenceLocation'],
    state: json['state'],
    cep: json['cep'],
    city: json['city'],
    neighbourhood: json['neighbourhood'],
    street: json['street'],
    number: json['number'],
    complement: json['complement'],
  );

  Map<String, dynamic> toJson() => {'id': id,
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
}