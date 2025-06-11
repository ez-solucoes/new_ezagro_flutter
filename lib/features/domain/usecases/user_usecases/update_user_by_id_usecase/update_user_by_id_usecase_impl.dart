import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/user_entities/user_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/user_repositories/user_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/user_usecases/update_user_by_id_usecase/update_user_by_id_usecase.dart';

class UpdateUserByIdUsecaseImpl implements UpdateUserByIdUsecase{
  final UserRepository repository;

  const UpdateUserByIdUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, ResponseEntity<UserEntity>>> call(ArgParams argParams) async {
    return await repository.updateUserById(argParams);
  }
}