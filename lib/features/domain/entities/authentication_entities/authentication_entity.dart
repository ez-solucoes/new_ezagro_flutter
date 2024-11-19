import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';


class AuthenticationEntity extends Equatable {
  final int? id;
  final String? token;
  final UserEntity? user;

  const AuthenticationEntity({
    this.id,
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [
        id,
        token,
        user,
      ];
}
