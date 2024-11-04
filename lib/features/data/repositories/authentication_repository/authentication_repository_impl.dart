import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';

import '../../../domain/entities/authentication_entities/authentication_entity.dart';
import '../../../domain/params/authentication_params/authentication_params.dart';
import '../../../domain/repositories/authentication_repository/authentication_repository.dart';
import '../../datasources/authentication_datasource/authentication_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, AuthenticationEntity>> authenticate(AuthenticationParams authenticationParams) async {
    try {
      final result = await datasource.authenticate(authenticationParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$AuthenticationRepositoryImpl.authentication',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, EmptyResult>> recoverPassword(AuthenticationParams authenticationParams) async {
    try {
      final result = await datasource.recoverPassword(authenticationParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$AuthenticationRepositoryImpl.recoverPassword',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }

  @override
  Future<Either<ApplicationError, AuthenticationEntity>> updatePassword(
      AuthenticationParams authenticationParams) async {
    try {
      final result = await datasource.updatePassword(authenticationParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
        fingerprint: '$AuthenticationRepositoryImpl.updatePassword',
        additionalInfo: stacktrace.toString(),
      ));
    }
  }
}