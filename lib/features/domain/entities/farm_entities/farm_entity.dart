import 'package:equatable/equatable.dart';

class FarmEntity extends Equatable {
  final int id;
  final String? name;
  final String? ownerName;
  final String? stateRegistration;
  final String? car;
  final String? caepf;
  final String? cnae;
  final double? headquarterLatitude;
  final double? headquarterLongitude;
  final String? addressZipCode;
  final String? addressStreet;
  final int? addressNumber;
  final String? addressCountry;
  final String? addressNeighborhood;
  final String? addressCity;
  final String? addressState;
  final String? addressComplement;
  final String? addressReference;
  final bool? isFavorite;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;


  const FarmEntity({
    required this.id,
    this.name,
    this.ownerName,
    this.stateRegistration,
    this.car,
    this.caepf,
    this.cnae,
    this.headquarterLatitude,
    this.headquarterLongitude,
    this.addressZipCode,
    this.addressStreet,
    this.addressNumber,
    this.addressCountry,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
    this.addressComplement,
    this.addressReference,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    ownerName,
    stateRegistration,
    car,
    caepf,
    cnae,
    headquarterLatitude,
    headquarterLongitude,
    addressZipCode,
    addressStreet,
    addressNumber,
    addressCountry,
    addressNeighborhood,
    addressCity,
    addressState,
    addressComplement,
    addressReference,
    isFavorite,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}