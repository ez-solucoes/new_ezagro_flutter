import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/user_params/user_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class UpdateUserByIdUsecase implements Usecase<ResponseEntity<UserEntity>, UserParams> {

  @override
  Future<Either<ApplicationError, ResponseEntity<UserEntity>>> call(UserParams userParams);
}