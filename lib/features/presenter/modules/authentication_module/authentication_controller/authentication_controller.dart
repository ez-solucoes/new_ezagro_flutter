import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/enums/first_access_enum.dart';
import 'package:new_ezagro_flutter/core/extensions/unmask_text_field_extension.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_item.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecase/authentication_usecase.dart';

import '../../../../../consts/app_strings.dart';
import '../../../../domain/entities/authentication_entities/authentication_entity.dart';
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
  String username = '';

  @observable
  String password = '';

  @observable
  String accessStatus = '';

  @observable
  String errorMessage = '';

  Future authenticate() async {
    isLoading = true;

    final authenticationUsecase = Modular.get<AuthenticationUsecase>();

    final result = await authenticationUsecase(
        AuthenticationParams(password: password, username: username.unmask));

    result.fold((error) => errorMessage = error.friendlyMessage,
        (success) async {
      name = success.employee?.employeeName ?? '';
      token = success.token;
      accessStatus = firstAccessEnum(success.firstAccessVerification);

      saveToken(success);
    });

    isLoading = false;
  }

  void saveToken(AuthenticationEntity success) async {
    final localStorage =
        Modular.get<LocalStorageClient>(key: AppStrings.storageTypeSecure);

    await localStorage.writeData(LocalStorageItem(
        key: AppStrings.idKey, value: success.client.id.toString()));
    await localStorage.writeData(
        LocalStorageItem(key: AppStrings.tokenKey, value: success.token));
    await localStorage.writeData(LocalStorageItem(
        key: AppStrings.nameKey, value: success.employee!.employeeName));
  }
}