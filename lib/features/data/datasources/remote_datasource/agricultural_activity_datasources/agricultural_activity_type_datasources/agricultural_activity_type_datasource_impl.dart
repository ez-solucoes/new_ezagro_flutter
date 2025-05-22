import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/http_client/http_client_helper.dart';
import '../../../../../../core/http_client/http_request.dart';
import '../../api_endpoints.dart';
import 'agricultural_activity_type_datasource.dart';

class AgriculturalActivityTypeDatasourceImpl
    with UriBuilder
    implements AgriculturalActivityTypeDatasource {
  final HttpClient httpClient;

  AgriculturalActivityTypeDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<TypeModel>> getAgriculturalActivityTypeById(
      ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalActivityTypeEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => TypeModel.fromMap(map),
          fromJson: (jsonString) {
            final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
            return TypeModel.fromJson(jsonEncode(jsonMap));
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<TypeModel>> getAllAgriculturalActivityTypes(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalActivityTypeEndpoint,
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
  Future<List<SelectModel>> getAllAgriculturalActivityTypesToSelect(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalActivityTypeEndpoint + AppEndpoints.selectEndpoint,
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
            return jsonList
                .map((json) => SelectModel.fromJson(jsonEncode(json)))
                .toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
