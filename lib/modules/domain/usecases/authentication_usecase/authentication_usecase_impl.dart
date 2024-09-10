import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/modules/domain/entities/authentication_entities/authentication_entity.dart';

import 'package:new_ezagro_flutter/modules/domain/params/authentication_params/authentication_params.dart';
import 'package:new_ezagro_flutter/modules/domain/repositories/authentication_repository/authentication_repository.dart';

import 'authentication_usecase.dart';

class AuthenticationUsecaseImpl implements AuthenticationUsecase {
  final AuthenticationRepositories repository;

  const AuthenticationUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, AuthenticationEntity>> call(
      AuthenticationParams authenticationParams) async {
    return await repository.authentication(authenticationParams);
  }
}
