import 'package:equatable/equatable.dart';

class FinancialInstitutionEntity extends Equatable {
  final int id;
  final String? compe;
  final String? ispb;
  final String? document;
  final String? longName;
  final String? shortName;
  final String? datePixServiceStarted;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const FinancialInstitutionEntity({
     required this.id,
     this.compe,
     this.ispb,
     this.document,
     this.longName,
     this.shortName,
     this.datePixServiceStarted,
     this.createdAt,
     this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props => [
    id,
    compe,
    ispb,
    document,
    longName,
    shortName,
    datePixServiceStarted,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}