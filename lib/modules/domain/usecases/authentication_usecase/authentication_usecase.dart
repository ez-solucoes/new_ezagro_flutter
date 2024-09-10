import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/authentication_entities/authentication_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/params/authentication_params/authentication_params.dart';

import '../../../../core/errors/application_error.dart';

abstract class AuthenticationUsecase
    implements Usecase<AuthenticationEntity, AuthenticationParams> {
  @override
  Future<Either<ApplicationError, AuthenticationEntity>> call(
      AuthenticationParams authenticationParams);
}
