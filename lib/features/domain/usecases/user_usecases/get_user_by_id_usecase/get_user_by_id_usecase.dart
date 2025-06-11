import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';

import '../../../params/arg_params/arg_params.dart';

abstract class GetUserByIdUsecase implements Usecase<ResponseEntity<UserEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<UserEntity>>> call(ArgParams argParams);
}