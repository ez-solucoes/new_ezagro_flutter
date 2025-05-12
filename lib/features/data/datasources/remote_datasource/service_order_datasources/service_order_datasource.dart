import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/field_service_order_models/field_service_order_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';
import '../../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderDatasource {
  Future<ResponseModel<PaginationModel<FieldServiceOrderModel>>> getServiceOrderList(NoParams noParams);

  Future<ResponseModel<FieldServiceOrderModel>> createServiceOrder(MockParams mockParams);

  Future<ResponseModel<ServiceOrderModel>> getServiceOrderById(ArgParams params);

  Future<List<ServiceOrderModel>> getServiceOrderListByStatusId(ArgParams params);

  Future<ResponseModel<ServiceOrderModel>> approveServiceOrderById(ArgParams params);

  Future<ResponseModel<ServiceOrderModel>> cancelServiceOrderById(ArgParams params);

}