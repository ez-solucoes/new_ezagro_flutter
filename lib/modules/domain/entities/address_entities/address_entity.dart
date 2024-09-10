import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int id;
  final String country;
  final String referenceLocation;
  final String state;
  final String cep;
  final String city;
  final String neighbourhood;
  final String street;
  final String number;
  final String complement;

  const AddressEntity(
      {required this.id,
      required this.country,
      required this.referenceLocation,
      required this.state,
      required this.cep,
      required this.city,
      required this.neighbourhood,
      required this.street,
      required this.number,
      required this.complement});

  @override
  List<Object?> get props => [
        id,
        country,
        referenceLocation,
        state,
        cep,
        city,
        neighbourhood,
        street,
        number,
        complement,
      ];
}
