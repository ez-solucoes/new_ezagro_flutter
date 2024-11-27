import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import '../../../../core/errors/application_error.dart';
import '../../entities/user_entities/user_entity.dart';
import '../../params/user_params/user_params.dart';

abstract class UserRepository {
  Future<Either<ApplicationError, ResponseEntity<UserEntity>>>getAllUsers(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<UserEntity>>>getUserById(UserParams userParams);
}