import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/api_endpoints.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/farm_plot_model.dart';

import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/http_client/http_request.dart';
import 'farm_plot_datasource.dart';

class FarmPlotDatasourceImpl with UriBuilder implements FarmPlotDatasource {
  final HttpClient httpClient;

  FarmPlotDatasourceImpl(this.httpClient);

  @override
  Future<List<FarmPlotModel>> getAllFarmPlots(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.farmPlotEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: {'farmId': argParams.firstArgs});
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
            response: result,
            fromListMap: (map) => map.map((e) => FarmPlotModel.fromMap(e)).toList(),
            fromJsonList: (jsonString) {
              final List<dynamic> jsonList = jsonDecode(jsonString);
              return jsonList
                  .map((json) => FarmPlotModel.fromJson(jsonEncode(json)))
                  .toList();
            });
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<FarmPlotModel>> getFarmPlotById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getFarmById,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => FarmPlotModel.fromMap(map),
          fromJson: (jsonString) => FarmPlotModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<SelectModel>> getAllFarmPlotsToSelect(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.farmPlotEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: {'farmId': argParams.firstArgs});
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
            response: result,
            fromListMap: (map) => map.map((e) => SelectModel.fromMap(e)).toList(),
            fromJsonList: (jsonString) {
              final List<dynamic> jsonList = jsonDecode(jsonString);
              return jsonList
                  .map((json) => SelectModel.fromJson(jsonEncode(json)))
                  .toList();
            });
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
