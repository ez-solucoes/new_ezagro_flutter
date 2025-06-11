
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/service_order_datasources/service_order_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/select_models/select_model.dart';
import '../api_endpoints.dart';

class ServiceOrderDatasourceImpl
    with UriBuilder
    implements ServiceOrderDatasource {
  final HttpClient httpClient;

  ServiceOrderDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<List<ServiceOrderModel>>> getAllServiceOrders(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.serviceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<ServiceOrderModel>(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => ServiceOrderModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> createServiceOrder(ArgParams argParams) async {
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
        return mountResponseModelForSingleItem<ServiceOrderModel>(
            response: result,
            fromMap: ServiceOrderModel.fromMap,
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> getServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: params.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<ServiceOrderModel>(
          response: result,
          fromMap: (map) =>
              ServiceOrderModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<ServiceOrderModel>>> getAllServiceOrdersByStatusId(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.serviceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url,queryParams: {'statusId' : params.firstArgs.toString()});
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<ServiceOrderModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => ServiceOrderModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> approveServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
        AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: params.firstArgs, sufix: 'approve');
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem(
          response: result,
          fromMap: (map) => ServiceOrderModel.fromMap(map),
        );
        default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> cancelServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: params.firstArgs, sufix: 'cancel');
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<ServiceOrderModel>(
          response: result,
          fromMap: (map) => ServiceOrderModel.fromMap(map),
        );
        default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllServiceOrdersToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.serviceOrderEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}
