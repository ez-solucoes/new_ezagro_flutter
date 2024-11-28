import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/user_params/user_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/user_repositories/user_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/user_usecases/get_user_by_id_usecase/get_user_by_id_usecase.dart';

class GetUserByIdUsecaseImpl implements GetUserByIdUsecase{
  final UserRepository repository;

  const GetUserByIdUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, ResponseEntity<UserEntity>>> call(UserParams userParams) async {
    return await repository.getUserById(userParams);
  }
}