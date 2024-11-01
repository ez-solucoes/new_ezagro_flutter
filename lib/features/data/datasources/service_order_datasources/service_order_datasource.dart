import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/field_service_order_models/field_service_order_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import '../../models/pagination_model/pagination_model.dart';
import '../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderDatasource {
  Future<PaginationModel<ServiceOrderListModel>> getServiceOrderList(NoParams noParams);

  Future<FieldServiceOrderModel> createServiceOrder(MockParams mockParams);

  Future<FieldServiceOrderModel> getServiceOrderById(ArgParams params);
}