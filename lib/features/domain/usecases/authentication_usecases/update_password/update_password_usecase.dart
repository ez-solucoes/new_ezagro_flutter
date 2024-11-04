import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/params/authentication_params/authentication_params.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../entities/authentication_entities/authentication_entity.dart';

abstract class UpdatePasswordUsecase
    implements Usecase<AuthenticationEntity, AuthenticationParams> {
  @override
  Future<Either<ApplicationError, AuthenticationEntity>> call(
      AuthenticationParams authenticationParams);
}
