import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderDatasource {
  Future<ServiceOrderListModel> getServiceOrderList(NoParams noParams);
}