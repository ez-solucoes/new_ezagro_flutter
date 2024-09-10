import 'package:new_ezagro_flutter/modules/domain/params/authentication_params/authentication_params.dart';

abstract class AuthenticationDatasource{
  Future authenticate(AuthenticationParams authenticationParams);

  Future recoverPassword(AuthenticationParams authenticationParams);

}