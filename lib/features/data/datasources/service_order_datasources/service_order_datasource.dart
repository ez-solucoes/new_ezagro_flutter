import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import '../../models/paginatino_model/pagination_model.dart';
import '../../models/service_order_list_model/service_order_list_model.dart';

abstract class ServiceOrderDatasource {
  Future<PaginationModel<ServiceOrderListModel>> getServiceOrderList(NoParams noParams);

  Future<MockModel> createServiceOrder(MockParams mockParams);
}