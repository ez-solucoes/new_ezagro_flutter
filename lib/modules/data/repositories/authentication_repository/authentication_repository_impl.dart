import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/modules/domain/entities/authentication_entities/authentication_entity.dart';
import 'package:new_ezagro_flutter/modules/domain/params/authentication_params/authentication_params.dart';
import 'package:new_ezagro_flutter/modules/domain/repositories/authentication_repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepositories {
  @override
  Future<Either<ApplicationError, AuthenticationEntity>> authentication(AuthenticationParams params) {
    // TODO: implement authentication
    throw UnimplementedError();
  }

}