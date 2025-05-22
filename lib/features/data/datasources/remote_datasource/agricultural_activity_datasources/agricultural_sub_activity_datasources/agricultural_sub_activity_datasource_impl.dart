import 'dart:convert';

import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_sub_activity_models/agricultural_sub_activity_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/http_client/http_client.dart';
import '../../../../../../core/http_client/http_client_helper.dart';
import '../../../../../../core/http_client/http_request.dart';
import '../../api_endpoints.dart';
import 'agricultural_sub_activity_datasource.dart';

class AgriculturalSubActivityDatasourceImpl with UriBuilder implements AgriculturalSubActivityDatasource {
  final HttpClient httpClient;

  AgriculturalSubActivityDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<AgriculturalSubActivityModel>> getAgriculturalSubActivityById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalSubActivityEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => AgriculturalSubActivityModel.fromMap(map),
          fromJson: (jsonString) {
            final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
            return AgriculturalSubActivityModel.fromJson(jsonEncode(jsonMap));
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<AgriculturalSubActivityModel>> getAllAgriculturalSubActivities(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalSubActivityEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => AgriculturalSubActivityModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => AgriculturalSubActivityModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<SelectModel>> getAllAgriculturalSubActivitiesToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalSubActivityEndpoint + AppEndpoints.selectEndpoint,
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