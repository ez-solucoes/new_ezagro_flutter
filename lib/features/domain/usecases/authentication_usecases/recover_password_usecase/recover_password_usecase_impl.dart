import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';
import 'package:new_ezagro_flutter/features/domain/params/authentication_params/authentication_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/recover_password_usecase/recover_password_usecase.dart';

class RecoverPasswordUsecaseImpl implements RecoverPasswordUsecase {
  final AuthenticationRepository repository;

  const RecoverPasswordUsecaseImpl({required this.repository});

  @override
  Future<Either<ApplicationError, EmptyResult>> call(
      AuthenticationParams params) async {
    return await repository.recoverPassword(params);
  }
}
