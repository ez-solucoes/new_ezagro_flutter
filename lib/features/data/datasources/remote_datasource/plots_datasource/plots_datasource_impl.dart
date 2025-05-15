import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/plots_datasource/plots_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';

import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';

class PlotsDatasourceImpl with UriBuilder implements PlotsDatasource {
  final HttpClient httpClient;

  PlotsDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<PaginationModel<PlotModel>>> getPlots(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getPlotsEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, PlotModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, PlotModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<PaginationModel<PlotModel>>> getPlotByFarmId(ArgParams params) async {
    final String id = params.firstArgs == null ? "" : params.firstArgs as String;
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getPlotsByFarmIdEndpoint + id
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, PlotModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, PlotModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
