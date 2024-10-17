import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int id;
  final String? country;
  final String? referenceLocation;
  final String? state;
  final String? cep;
  final String? city;
  final String? neighbourhood;
  final String? street;
  final String? number;
  final String? complement;

  const AddressEntity(
      {
        required this.id,
      this.country,
      this.referenceLocation,
      this.state,
      this.cep,
      this.city,
      this.neighbourhood,
      this.street,
      this.number,
      this.complement});

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
