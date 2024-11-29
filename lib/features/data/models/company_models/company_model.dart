import 'dart:convert';

import '../../../domain/entities/company_entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    super.name,
    super.isLegalPerson,
    super.isCreditor,
    super.isDebtor,
    super.isOwn,
    super.stateRegistration,
    super.phoneNumber,
    super.whatsappNumber,
    super.email,
    super.legalDocumentNumber,
    super.isServiceProvider,
    super.isProductSupplier,
    super.isBlocked,
    super.isActive,
    super.addressZipCode,
    super.addressStreet,
    super.addressNumber,
    super.addressCountry,
    super.addressNeighborhood,
    super.addressCity,
    super.addressState,
    super.addressComplement,
    super.addressReference,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isLegalPerson': isLegalPerson,
      'isCreditor': isCreditor,
      'isDebtor': isDebtor,
      'isOwn': isOwn,
      'stateRegistration': stateRegistration,
      'phoneNumber': phoneNumber,
      'whatsappNumber': whatsappNumber,
      'email': email,
      'legalDocumentNumber': legalDocumentNumber,
      'isServiceProvider': isServiceProvider,
      'isProductSupplier': isProductSupplier,
      'isBlocked': isBlocked,
      'isActive': isActive,
      'addressZipCode': addressZipCode,
      'addressStreet': addressStreet,
      'addressNumber': addressNumber,
      'addressCountry': addressCountry,
      'addressNeighborhood': addressNeighborhood,
      'addressCity': addressCity,
      'addressState': addressState,
      'addressComplement': addressComplement,
      'addressReference': addressReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as int,
      name: map['name'] as String?,
      isLegalPerson: map['isLegalPerson'] as bool?,
      isCreditor: map['isCreditor'] as bool?,
      isDebtor: map['isDebtor'] as bool?,
      isOwn: map['isOwn'] as bool?,
      stateRegistration: map['stateRegistration'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      whatsappNumber: map['whatsappNumber'] as String?,
      email: map['email'] as String?,
      legalDocumentNumber: map['legalDocumentNumber'] as String?,
      isServiceProvider: map['isServiceProvider'] as bool?,
      isProductSupplier: map['isProductSupplier'] as bool?,
      isBlocked: map['isBlocked'] as bool?,
      isActive: map['isActive'] as bool?,
      addressZipCode: map['addressZipCode'] as String?,
      addressStreet: map['addressStreet'] as String?,
      addressNumber: map['addressNumber'] as int?,
      addressCountry: map['addressCountry'] as String?,
      addressNeighborhood: map['addressNeighborhood'] as String?,
      addressCity: map['addressCity'] as String?,
      addressState: map['addressState'] as String?,
      addressComplement: map['addressComplement'] as String?,
      addressReference: map['addressReference'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<List<String>> convertToTableList(List<CompanyEntity> companies) {
    return companies.map((e) => [e.id.toString(), e.name ?? "", e.legalDocumentNumber ?? ""]).toList();
  }

}