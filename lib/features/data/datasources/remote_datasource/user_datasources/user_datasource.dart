import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/user_models/user_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class UserDatasource{
  Future<ResponseModel<List<UserModel>>> getAllUsers(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllUsersToSelect(NoParams noParams);
  Future<ResponseModel<UserModel>> getUserById(ArgParams argParams);
  Future<ResponseModel<UserModel>> updateUserById(ArgParams argParams);
}