import '../email_entities/email_entity.dart';
import '../phone_entities/phone_entity.dart';

class ClientEntity {
  final int id;
  final String? name;
  final String? cpf;
  final PhoneEntity? phone;
  final EmailEntity? email;

  ClientEntity({
    required this.id,
    this.name,
    this.cpf,
    this.phone,
    this.email,
  });
}
