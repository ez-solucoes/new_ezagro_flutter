
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/purchase_request_datasources/purchase_request_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/purchase_request_models/send_purchase_request_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/send_purchase_request_entity.dart';

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
  Future<ResponseModel<List<PurchaseRequestModel>>> getAllPurchaseRequests(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<PurchaseRequestModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => PurchaseRequestModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> getPurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<PurchaseRequestModel>(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<PurchaseRequestModel>>> getAllPurchaseRequestsByStatusId(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final HttpRequest request =
        HttpRequest.get(path: url, queryParams: {'statusId': argParams.firstArgs.toString()});
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<PurchaseRequestModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => PurchaseRequestModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> approvePurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: argParams.firstArgs, sufix: 'approve');
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<PurchaseRequestModel>(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> cancelPurchaseRequestById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final HttpRequest request = HttpRequest.patch(path: url, id: argParams.firstArgs, sufix: 'cancel');
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<PurchaseRequestModel>(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllPurchaseRequestsToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PurchaseRequestModel>> createPurchaseRequest(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequest,
    );

    final SendPurchaseRequestEntity sendPurchaseRequestEntity = argParams.firstArgs as SendPurchaseRequestEntity;
    final SendPurchaseRequestModel sendPurchaseRequestModel = SendPurchaseRequestModel.fromEntity(sendPurchaseRequestEntity);
    final payload = sendPurchaseRequestModel.toMap();


    final HttpRequest request = HttpRequest.post(path: url, payload: payload);

    final result = await httpClient.execute(request);
    switch(result.statusCode) {
      case 201:
        return mountResponseModelForSingleItem<PurchaseRequestModel>(
          response: result,
          fromMap: (map) => PurchaseRequestModel.fromMap(map),
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
