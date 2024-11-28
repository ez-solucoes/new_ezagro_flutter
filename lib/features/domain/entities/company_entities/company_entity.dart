import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String? name;
  final bool? isLegalPerson;
  final bool? isCreditor;
  final bool? isDebtor;
  final bool? isOwn;
  final String? stateRegistration;
  final String? phoneNumber;
  final String? whatsappNumber;
  final String? email;
  final String? legalDocumentNumber;
  final bool? isServiceProvider;
  final bool? isProductSupplier;
  final bool? isBlocked;
  final bool? isActive;
  final String? addressZipCode;
  final String? addressStreet;
  final int? addressNumber;
  final String? addressCountry;
  final String? addressNeighborhood;
  final String? addressCity;
  final String? addressState;
  final String? addressComplement;
  final String? addressReference;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const CompanyEntity({
    required this.id,
    this.name,
    this.isLegalPerson,
    this.isCreditor,
    this.isDebtor,
    this.isOwn,
    this.stateRegistration,
    this.phoneNumber,
    this.whatsappNumber,
    this.email,
    this.legalDocumentNumber,
    this.isServiceProvider,
    this.isProductSupplier,
    this.isBlocked,
    this.isActive,
    this.addressZipCode,
    this.addressStreet,
    this.addressNumber,
    this.addressCountry,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
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
    isLegalPerson,
    isCreditor,
    isDebtor,
    isOwn,
    stateRegistration,
    phoneNumber,
    whatsappNumber,
    email,
    legalDocumentNumber,
    isServiceProvider,
    isProductSupplier,
    isBlocked,
    isActive,
    addressZipCode,
    addressStreet,
    addressNumber,
    addressCountry,
    addressNeighborhood,
    addressCity,
    addressState,
    addressComplement,
    addressReference,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}