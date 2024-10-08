import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/features/data/datasources/authentication_datasource/authentication_datasource.dart';
import '../../../domain/entities/authentication_entities/authentication_entity.dart';
import '../../../domain/params/authentication_params/authentication_params.dart';
import '../../../domain/repositories/authentication_repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, AuthenticationEntity>> authentication(
      AuthenticationParams authenticationParams) async {
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
}
