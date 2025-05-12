import 'dart:convert';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/purchase_request_datasources/purchase_request_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../core/http_client/http_client.dart';
import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/purchase_request_models/purchase_request_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';

class PurchaseRequestDatasourceImpl with UriBuilder implements PurchaseRequestDatasource {
  final HttpClient httpClient;

  PurchaseRequestDatasourceImpl(this.httpClient);

  @override
  Future<List<PurchaseRequestModel>> getAllPurchaseRequest(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => PurchaseRequestModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => PurchaseRequestModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> getPurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
          fromJson: (jsonString) => PurchaseRequestModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<PurchaseRequestModel>> getPurchaseRequestByStatusId(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request =
        HttpRequest.get(path: url, queryParams: {'statusId': argParams.firstArgs.toString()});
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => PurchaseRequestModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => PurchaseRequestModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> approvePurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: argParams.firstArgs, sufix: 'approve');
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
          fromJson: (jsonString) => PurchaseRequestModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> cancelPurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: argParams.firstArgs, sufix: 'cancel');
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
          fromJson: (jsonString) => PurchaseRequestModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<SelectModel>> getAllPurchaseRequestToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => SelectModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => SelectModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> createPurchaseRequest(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPurchaseRequest,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: argParams.firstArgs);
    final result = await httpClient.execute(request);
    switch(result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
          fromJson: (jsonString) => PurchaseRequestModel.fromJson(jsonString),
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
