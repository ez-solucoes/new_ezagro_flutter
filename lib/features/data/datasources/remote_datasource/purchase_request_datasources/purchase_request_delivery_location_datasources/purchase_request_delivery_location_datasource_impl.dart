import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/purchase_request_datasources/purchase_request_delivery_location_datasources/purchase_request_delivery_location_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/http_client/http_client_helper.dart';
import '../../../../../../core/http_client/http_request.dart';
import '../../api_endpoints.dart';

class PurchaseRequestDeliveryLocationDatasourceImpl with UriBuilder implements PurchaseRequestDeliveryLocationDatasource {
  final HttpClient httpClient;

  PurchaseRequestDeliveryLocationDatasourceImpl(this.httpClient);

  @override
  Future<List<TypeModel>> getAllPurchaseRequestDeliveryLocations(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.purchaseRequestDeliveryLocationEndpoint,
    );
    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => TypeModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => TypeModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<SelectModel>> getAllPurchaseRequestDeliveryLocationsToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.purchaseRequestDeliveryLocationEndpoint + AppEndpoints.selectEndpoint,
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
  Future<ResponseModel<TypeModel>> getPurchaseRequestDeliveryLocationById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.purchaseRequestDeliveryLocationEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => TypeModel.fromMap(map),
          fromJson: (jsonString) => TypeModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}