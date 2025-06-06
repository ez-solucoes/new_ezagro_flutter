import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';
import 'package:new_ezagro_flutter/features/data/models/authentication_models/authentication_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/authentication_params/authentication_params.dart';

abstract class AuthenticationDatasource {
  Future<ResponseModel<AuthenticationModel>> authenticate(
      AuthenticationParams authenticationParams);

  Future<EmptyResult> recoverPassword(AuthenticationParams authenticationParams);

  Future<ResponseModel<AuthenticationModel>> updatePassword(
      AuthenticationParams authenticationParams);
}
