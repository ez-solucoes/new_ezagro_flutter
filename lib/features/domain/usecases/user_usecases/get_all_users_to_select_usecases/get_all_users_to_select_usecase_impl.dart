import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/user_repositories/user_repository.dart';

import 'get_all_users_to_select_usecase.dart';

class GetAllUsersToSelectUsecaseImpl implements GetAllUsersToSelectUsecase{
  final UserRepository repository;

  const GetAllUsersToSelectUsecaseImpl(this.repository);
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams noParams) async {
    return await repository.getAllUsersToSelect(noParams);
  }
}