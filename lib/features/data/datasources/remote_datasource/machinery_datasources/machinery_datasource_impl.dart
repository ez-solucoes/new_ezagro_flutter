import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';

import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'machinery_datasource.dart';

class MachineryDatasourceImpl with UriBuilder implements MachineryDatasource {
  final HttpClient httpClient;

  MachineryDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<PaginationModel<MachineryImplementModel>>> getMachinery(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getMachineryEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, MachineryImplementModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, MachineryImplementModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<MachineryImplementModel>> getAllMachineryImplement(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getAllMachineryImplementEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: MachineryImplementModel.fromListMap,
          fromJsonList: MachineryImplementModel.fromJsonList,
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<MachineryImplementModel>> getMachineryImplementById(int id) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getAllMachineryImplementEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: id);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: MachineryImplementModel.fromMap,
          fromJson: MachineryImplementModel.fromJson,
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
