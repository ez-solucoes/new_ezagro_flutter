import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../models/select_models/select_model.dart';

abstract class PurchaseRequestTypeDatasource {
  Future<ResponseModel<List<TypeModel>>> getAllPurchaseRequestTypes(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllPurchaseRequestTypesToSelect(NoParams noParams);
  Future<ResponseModel<TypeModel>> getPurchaseRequestTypesById(ArgParams argParams);
}