import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/service_order_datasources/service_order_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/field_service_order_models/field_service_order_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/service_order_list_model/service_order_list_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../api_endpoints.dart';
import '../../../../domain/params/create_service_order_params/create_service_order_params.dart';
import '../../../models/pagination_model/pagination_model.dart';

class ServiceOrderDatasourceImpl
    with UriBuilder
    implements ServiceOrderDatasource {
  final HttpClient httpClient;

  ServiceOrderDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<PaginationModel<FieldServiceOrderModel>>> getServiceOrderList(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getServiceOrderListEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, FieldServiceOrderModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, FieldServiceOrderModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<FieldServiceOrderModel>> createServiceOrder(MockParams mockParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
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

  @override
  Future<ResponseModel<ServiceOrderModel>> getServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: params.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              ServiceOrderModel.fromMap(map),
          fromJson: (jsonString) => ServiceOrderModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<ServiceOrderModel>> getServiceOrderListByStatusId(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getServiceOrderListEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url,queryParams: {'statusId' : params.firstArgs.toString()});
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => ServiceOrderModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => ServiceOrderModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> approveServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
        AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: params.firstArgs, sufix: 'approve');
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => ServiceOrderModel.fromMap(map),
          fromJson: (jsonString) => ServiceOrderModel.fromJson(jsonString),
        );
        default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ServiceOrderModel>> cancelServiceOrderById(ArgParams params) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getServiceOrderEndpoint,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: params.firstArgs, sufix: 'cancel');
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => ServiceOrderModel.fromMap(map),
          fromJson: (jsonString) => ServiceOrderModel.fromJson(jsonString),
        );
        default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}
