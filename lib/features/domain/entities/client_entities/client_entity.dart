
import 'package:equatable/equatable.dart';

class ClientEntity extends Equatable {
  final int? id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final bool isActive;
  final String cpf;
  final String phoneNumber;
  final String whatsappPhone;


  const ClientEntity({
    this.id,
    required this.whatsappPhone,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.cpf,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props =>[
    id,
    whatsappPhone,
    name,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
    cpf,
    phoneNumber,
  ];
}
