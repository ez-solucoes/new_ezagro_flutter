import 'dart:convert';
import '../../../domain/entities/issuer_recipient_entities/issuer_recipient_entity.dart';


class IssuerRecipientModel extends IssuerRecipientEntity {
  const IssuerRecipientModel({
    required super.id,
    required super.name,
    required super.issuerRecipientType,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'issuerRecipientType': issuerRecipientType,
  };

  factory IssuerRecipientModel.fromMap(Map<String, dynamic> map) =>
      IssuerRecipientModel(
        id: map['id'],
        name: map['name'],
        issuerRecipientType: map['issuerRecipientType'],
      );

  String toJson() => json.encode(toMap());

  factory IssuerRecipientModel.fromJson(String source) =>IssuerRecipientModel.fromMap(json.decode(source));

}