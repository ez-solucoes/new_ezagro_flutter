import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class PurchaseRequestDeliveryLocationDatasource {
  Future<ResponseModel<List<TypeModel>>> getAllPurchaseRequestDeliveryLocations(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllPurchaseRequestDeliveryLocationsToSelect(NoParams noParams);
  Future<ResponseModel<TypeModel>> getPurchaseRequestDeliveryLocationById(ArgParams argParams);
}