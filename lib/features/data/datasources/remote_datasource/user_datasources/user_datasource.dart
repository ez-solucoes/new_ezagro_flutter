import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/user_models/user_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/user_params/user_params.dart';

abstract class UserDatasource{
  Future<ResponseModel<UserModel>> getAllUsers(NoParams noParams);

  Future<ResponseModel<UserModel>> getUserById(UserParams userParams);

  Future<ResponseModel<UserModel>> updateUserById(UserParams userParams);

}