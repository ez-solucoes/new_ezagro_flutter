

import 'dart:io';

import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';

class ServiceOrderListDatasourceImpl
  with UriBuilder
  implements ServiceOrderListDatasource {

  final HttpClient httpClient;

  ServiceOrderListDatasourceImpl(this.httpClient);

  @override
  Future<ServiceOrderListModel> getServiceOrderList(
        NoParams: noParams) async {
    final String url = mountUrl()
  }
}