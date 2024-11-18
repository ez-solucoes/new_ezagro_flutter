import 'dart:convert';

import '../../../domain/entities/client_entities/client_entity.dart';
import '../email_model/email_model.dart';
import '../phone_models/phone_model.dart';

class ClientModel extends ClientEntity {
  ClientModel({
    required super.id,
    super.name,
    super.cpf,
    super.phone,
    super.email,
  });

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'cpf': cpf,
        'phone': phone == null ? null : (phone as PhoneModel).toMap(),
        'email': email == null ? null : (email as EmailModel).toMap(),
      };

  factory ClientModel.fromMap(Map<String, dynamic> map) => ClientModel(
        id: map['id'],
        name: map['name'],
        cpf: map['cpf'],
        phone: map['phone'] == null ? null : PhoneModel.fromMap(map['phone']),
        email: map['email'] == null ? null : EmailModel.fromMap(map['email']),
      );
}
