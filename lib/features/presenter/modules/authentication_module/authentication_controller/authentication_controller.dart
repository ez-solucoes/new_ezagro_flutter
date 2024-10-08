import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/enums/first_access_verification_enum.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecase/authentication_usecase.dart';

import '../../../../domain/params/authentication_params/authentication_params.dart';

part 'authentication_controller.g.dart';

class AuthenticationController = AuthenticationControllerAbstract
    with _$AuthenticationController;

abstract class AuthenticationControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  String token = '';

  @observable
  String name = '';

  @observable
  String username = '11111111111';

  @observable
  String password = '123456';

  @observable
  String accessStatus = '';

  @observable
  String errorMessage = '';

  Future authenticate() async {
    isLoading = true;

    final authenticationUsecase = Modular.get<AuthenticationUsecase>();

    final result = await authenticationUsecase(
        AuthenticationParams(password: password, username: username));

    result.fold(
            (error) => errorMessage = error.friendlyMessage,
            (success) async {
              name = success.employee?.employeeName ?? '';
              token = success.token;
              accessStatus = firstAccessVerificationEnum(success.firstAccessVerification);

    });

    isLoading = false;
  }
}
