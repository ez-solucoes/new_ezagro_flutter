import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/pagination_model/pagination_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/user_models/user_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/user_params/user_params.dart';

import '../../../../../core/usecase/empty_result.dart';

abstract class UserDatasource{
  Future<ResponseModel<PaginationModel<UserModel>>> getAllUsers(NoParams noParams);

  Future<ResponseModel<UserModel>> getUserById(UserParams userParams);

  Future<EmptyResult> updateUserById(UserParams userParams);

}