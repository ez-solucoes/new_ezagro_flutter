import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../models/select_models/select_model.dart';

abstract class PurchaseRequestDatasource {
  Future<ResponseModel<List<PurchaseRequestModel>>> getAllPurchaseRequestsByStatusId(ArgParams argParams);
  Future<ResponseModel<PurchaseRequestModel>> getPurchaseRequestById(ArgParams argParams);
  Future<ResponseModel<List<PurchaseRequestModel>>> getAllPurchaseRequests(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllPurchaseRequestsToSelect(NoParams noParams);
  Future<ResponseModel<PurchaseRequestModel>> approvePurchaseRequestById(ArgParams argParams);
  Future<ResponseModel<PurchaseRequestModel>> cancelPurchaseRequestById(ArgParams argParams);
  Future<ResponseModel<PurchaseRequestModel>> createPurchaseRequest(ArgParams argParams);


}