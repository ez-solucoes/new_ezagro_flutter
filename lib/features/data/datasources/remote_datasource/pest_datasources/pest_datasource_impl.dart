import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/pest_datasources/pest_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';

class PestDatasourceImpl with UriBuilder implements PestDatasource {
  final HttpClient httpClient;

  PestDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<PaginationModel<PestModel>>> getPests(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getPestsEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, PestModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, PestModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
