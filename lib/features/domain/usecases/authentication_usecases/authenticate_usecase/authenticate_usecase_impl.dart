import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import '../../../entities/authentication_entities/authentication_entity.dart';
import '../../../params/authentication_params/authentication_params.dart';

import '../../../repositories/authentication_repository/authentication_repository.dart';
import 'authenticate_usecase.dart';

class AuthenticateUsecaseImpl implements AuthenticateUsecase {
  final AuthenticationRepository repository;

  const AuthenticateUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, AuthenticationEntity>> call(
      AuthenticationParams authenticationParams) async {
    return await repository.authenticate(authenticationParams);
  }
}
