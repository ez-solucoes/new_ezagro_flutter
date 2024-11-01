import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/authentication_entities/authentication_entity.dart';
import '../../../params/authentication_params/authentication_params.dart';

abstract class AuthenticateUsecase
    implements Usecase<AuthenticationEntity, AuthenticationParams> {
  @override
  Future<Either<ApplicationError, AuthenticationEntity>> call(
      AuthenticationParams authenticationParams);
}
