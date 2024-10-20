import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/cost_center_datasource/cost_center_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../api_endpoints.dart';
import '../../models/pagination_model/pagination_model.dart';

class CostCenterDatasourceImpl with UriBuilder implements CostCenterDatasource {

  final HttpClient httpClient;

  CostCenterDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<CostCenterModel>> getCostCenters(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getCostCentersEndpoint,
    );

    final HttpRequest request = HttpRequest.get( path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, CostCenterModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, CostCenterModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }

  }
}