import 'dart:convert';

import '../../../domain/entities/client_entities/client_entity.dart';

class ClientModel extends ClientEntity {
  const ClientModel({
    super.id,
    required super.whatsappPhone,
    required super.name,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
    required super.cpf,
    required super.phoneNumber,
    super.deletedAt,
  });

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) => ClientModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'whatsappPhone': whatsappPhone,
        'phoneNumber': phoneNumber,
        'name': name,
        'isActive': isActive,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt == null ? null : deletedAt as String,
        'cpf': cpf,
      };

  factory ClientModel.fromMap(Map<String, dynamic> map) => ClientModel(
        id: map['id'] == null ? null : map['id'] as int,
        whatsappPhone: map['whatsappPhone'] as String,
        phoneNumber: map['phoneNumber'] as String,
        name: map['name'] as String,
        cpf: map['cpf'] as String,
        isActive: map['isActive'] as bool,
        createdAt: map['createdAt'] as String,
        updatedAt: map['updatedAt'] as String,
        deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      );
}
