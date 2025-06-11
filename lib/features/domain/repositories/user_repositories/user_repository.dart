import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../core/errors/application_error.dart';
import '../../entities/user_entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<ApplicationError, ResponseEntity<List<UserEntity>>>>getAllUsers(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>getAllUsersToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<UserEntity>>>getUserById(ArgParams argParams);

  Future<Either<ApplicationError, ResponseEntity<UserEntity>>> updateUserById(ArgParams argParams);
}