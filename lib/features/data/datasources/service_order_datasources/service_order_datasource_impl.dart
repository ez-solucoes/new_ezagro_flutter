import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/service_order_datasources/service_order_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/field_service_order_models/field_service_order_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../api_endpoints.dart';
import '../../../domain/params/create_service_order_params/create_service_order_params.dart';
import '../../models/pagination_model/pagination_model.dart';

class ServiceOrderDatasourceImpl
    with UriBuilder
    implements ServiceOrderDatasource {
  final HttpClient httpClient;

  ServiceOrderDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<ServiceOrderListModel>> getServiceOrderList(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getServiceOrderListEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
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

  @override
  Future<FieldServiceOrderModel> createServiceOrder(MockParams mockParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.postServiceOrderEndpoint,
    );

    Map<String, dynamic> postServiceOrderAsJson() => {};

    final HttpRequest request =
        HttpRequest.post(path: url, payload: postServiceOrderAsJson());
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
            response: result,
            fromMap: FieldServiceOrderModel.fromMap,
            fromJson: FieldServiceOrderModel.fromJson);
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}
