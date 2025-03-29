import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  final int id;
  final String? name;
  final String? email;
  final bool? isInternal;
  final bool? isExternal;
  final String? latitude;
  final String? longitude;
  final String? phoneNumber;
  final String? whatsappNumber;
  final String? addressStreet;
  final String? addressNumber;
  final String? addressNeighborhood;
  final String? addressCity;
  final String? addressState;
  final String? addressCountry;
  final String? addressZipCode;
  final String? addressComplement;
  final String? addressReference;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const StockEntity({
    required this.id,
    this.name,
    this.email,
    this.isInternal,
    this.isExternal,
    this.latitude,
    this.longitude,
    this.phoneNumber,
    this.whatsappNumber,
    this.addressStreet,
    this.addressNumber,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
    this.addressCountry,
    this.addressZipCode,
    this.addressComplement,
    this.addressReference,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    isInternal,
    isExternal,
    latitude,
    longitude,
    phoneNumber,
    whatsappNumber,
    addressStreet,
    addressNumber,
    addressNeighborhood,
    addressCity,
    addressState,
    addressCountry,
    addressZipCode,
    addressComplement,
    addressReference,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}
