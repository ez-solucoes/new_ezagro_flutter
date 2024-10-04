import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/plots_datasource/plots_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/plot_models/plot_model.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../api_endpoints.dart';
import '../../models/pagination_model/pagination_model.dart';

class PlotsDatasourceImpl with UriBuilder implements PlotsDatasource {

  final HttpClient httpClient;

  PlotsDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<PlotModel>> getPlots(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getPlotsEndpoint,
    );

    final HttpRequest request = HttpRequest.get( path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, PlotModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, PlotModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }

  }
}