import 'package:equatable/equatable.dart';

class IssuerRecipientEntity extends Equatable {
  final int id;
  final String name;
  final String issuerRecipientType;

  const IssuerRecipientEntity({
    required this.id,
    required this.name,
    required this.issuerRecipientType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        issuerRecipientType,
      ];
}
