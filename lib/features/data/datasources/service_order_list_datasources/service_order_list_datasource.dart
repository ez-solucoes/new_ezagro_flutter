import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderListDatasource {
  Future<List<ServiceOrderListModel>> getServiceOrderList(NoParams noParams);
}