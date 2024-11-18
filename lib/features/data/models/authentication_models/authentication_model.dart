import 'dart:convert';

import '../../../domain/entities/authentication_entities/authentication_entity.dart';
import '../user_models/user_model.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel({
    super.id,
    super.token,
    super.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'token': token,
      'user': (user as UserModel).toMap(),
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      id: map['id'] == null ? null : map['id'] as int,
      token: map['token'] == null ? null : map['token'] as String,
      user:
          map['user'] == null ? null : UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
