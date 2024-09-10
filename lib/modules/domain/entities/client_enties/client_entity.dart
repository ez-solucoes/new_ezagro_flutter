import 'package:new_ezagro_flutter/modules/domain/entities/email_entities/email_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/phone_entities/phone_entity.dart';

class ClientEntity {
  final int id;
  final String name;
  final String? cpf;
  final PhoneEntity phone;
  final EmailEntity email;

  ClientEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
  });

}