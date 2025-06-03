import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';

import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'agricultural_input_datasource.dart';

class AgriculturalInputDatasourceImpl with UriBuilder implements AgriculturalInputDatasource {
  final HttpClient httpClient;

  AgriculturalInputDatasourceImpl({required this.httpClient});

  @override
  Future<ResponseModel<AgriculturalInputModel>> getAgriculturalInputById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => AgriculturalInputModel.fromMap(map),
          fromJson: (jsonString) {
            final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
            return AgriculturalInputModel.fromJson(jsonEncode(jsonMap));
          },
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<AgriculturalInputModel>> getAllAgriculturalInputs(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) =>
              (map).map((e) => AgriculturalInputModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList
                .map((json) => AgriculturalInputModel.fromJson(jsonEncode(json)))
                .toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<SelectModel>> getAllAgriculturalInputsToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint + AppEndpoints.selectEndpoint,
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