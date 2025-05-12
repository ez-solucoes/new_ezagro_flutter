import 'dart:convert';
import '../../../domain/entities/financial_institution_entities/financial_institution_entity.dart';

class FinancialInstitutionModel extends FinancialInstitutionEntity {
  const FinancialInstitutionModel({
    required super.id,
    super.compe,
    super.ispb,
    super.document,
    super.longName,
    super.shortName,
    super.datePixServiceStarted,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'compe': compe,
      'ispb': ispb,
      'document': document,
      'longName': longName,
      'shortName': shortName,
      'datePixServiceStarted': datePixServiceStarted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }

  factory FinancialInstitutionModel.fromMap(Map<String, dynamic> map) {
    return FinancialInstitutionModel(
      id: map['id'] as int,
      compe: map['compe'] as String?,
      ispb: map['ispb'] as String?,
      document: map['document'] as String?,
      longName: map['longName'] as String?,
      shortName: map['shortName'] as String?,
      datePixServiceStarted: map['datePixServiceStarted'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      deletedAt: map['deletedAt'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialInstitutionModel.fromJson(String source) =>
      FinancialInstitutionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}