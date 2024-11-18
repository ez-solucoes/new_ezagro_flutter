import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String whatsappPhone;
  final String username;
  final String password;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const UserEntity({
    this.id,
    required this.whatsappPhone,
    required this.username,
    required this.password,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  @override
  List<Object?> get props =>[
    id,
    whatsappPhone,
    username,
    password,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}
