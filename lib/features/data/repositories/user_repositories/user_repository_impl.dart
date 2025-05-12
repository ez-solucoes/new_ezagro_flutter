import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/user_datasources/user_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/user_models/user_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/user_params/user_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/user_repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, ResponseModel<UserModel>>> getAllUsers(
      NoParams noParams) async {
    try {
      final result = await datasource.getAllUsers(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$UserRepositoryImpl.getAllUsers',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<UserModel>>> getUserById(UserParams userParams) async {
    try {
      final result = await datasource.getUserById(userParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$UserRepositoryImpl.getUserById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, ResponseModel<UserModel>>> updateUserById(UserParams userParams) async {
    try {
      final result = await datasource.updateUserById(userParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$UserRepositoryImpl.updateUserById',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}
