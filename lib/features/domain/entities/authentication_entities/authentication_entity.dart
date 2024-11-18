import 'package:equatable/equatable.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/group_entitites/group_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';

import '../client_entities/client_entity.dart';
import '../employee_entities/employee_entity.dart';
import '../outsource_entities/outsource_entity.dart';

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
