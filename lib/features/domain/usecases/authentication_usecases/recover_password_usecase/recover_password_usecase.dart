import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/params/authentication_params/authentication_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class RecoverPasswordUsecase implements Usecase<EmptyResult, AuthenticationParams> {
  @override
  Future<Either<ApplicationError, EmptyResult>> call(AuthenticationParams params);
}