import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/purchase_request_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class PurchaseRequestDatasource {
  Future<List<PurchaseRequestModel>> getPurchaseRequestByStatusId(ArgParams argParams);

  Future<ResponseModel<PurchaseRequestModel>> getPurchaseRequestById(ArgParams argParams);

  Future<List<PurchaseRequestModel>> getAllPurchaseRequest(NoParams noParams);

  Future<ResponseModel<PurchaseRequestModel>> approvePurchaseRequestById(ArgParams argParams);

  Future<ResponseModel<PurchaseRequestModel>> cancelPurchaseRequestById(ArgParams argParams);


}