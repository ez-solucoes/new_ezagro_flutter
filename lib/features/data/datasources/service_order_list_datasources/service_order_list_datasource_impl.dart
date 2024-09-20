import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/service_order_list_datasources/service_order_list_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../modules/data/datasources/api_endpoints.dart';
import '../../models/paginatino_model/pagination_model.dart';

class ServiceOrderListDatasourceImpl with UriBuilder implements ServiceOrderListDatasource {

  final HttpClient httpClient;

  ServiceOrderListDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<ServiceOrderListModel>> getServiceOrderList(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getServiceOrderListEndpoint,
    );

    final HttpRequest request = HttpRequest.get( path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, ServiceOrderListModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, ServiceOrderListModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }

  }
}