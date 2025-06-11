import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/user_repositories/user_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/user_usecases/get_all_users_usecases/get_all_users_usecase.dart';

class GetAllUsersUsecaseImpl implements GetAllUsersUsecase{
  final UserRepository repository;

  const GetAllUsersUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, ResponseEntity<List<UserEntity>>>> call(NoParams noParams) async {
    return await repository.getAllUsers(noParams);
  }
}