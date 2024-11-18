import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/authentication_entities/authentication_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/authentication_params/authentication_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/update_password/update_password_usecase.dart';

import '../../../entities/response_entities/response_entity.dart';

class UpdatePasswordUsecaseImpl implements UpdatePasswordUsecase {
  final AuthenticationRepository repository;

  const UpdatePasswordUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, ResponseEntity<AuthenticationEntity>>> call(
      AuthenticationParams authenticationParams) async {
    return await repository.updatePassword(authenticationParams);
  }
}
