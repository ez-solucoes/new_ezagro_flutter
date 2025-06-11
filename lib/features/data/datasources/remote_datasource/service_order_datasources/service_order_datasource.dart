import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../models/response_models/response_model.dart';
import '../../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderDatasource {
  Future<ResponseModel<List<ServiceOrderModel>>> getAllServiceOrders(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllServiceOrdersToSelect(NoParams noParams);

  Future<ResponseModel<ServiceOrderModel>> createServiceOrder(ArgParams argParams);

  Future<ResponseModel<ServiceOrderModel>> getServiceOrderById(ArgParams argParams);

  Future<ResponseModel<List<ServiceOrderModel>>> getAllServiceOrdersByStatusId(ArgParams argParams);

  Future<ResponseModel<ServiceOrderModel>> approveServiceOrderById(ArgParams argParams);

  Future<ResponseModel<ServiceOrderModel>> cancelServiceOrderById(ArgParams argParams);

}