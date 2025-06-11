import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/machinery_implement_models/machinery_implement_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'machinery_implement_datasource.dart';

class MachineryImplementDatasourceImpl with UriBuilder implements MachineryImplementDatasource {
  final HttpClient httpClient;

  MachineryImplementDatasourceImpl(this.httpClient);


  @override
  Future<ResponseModel<List<MachineryImplementModel>>> getAllMachineryImplements(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.machineryImplementEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<MachineryImplementModel>(
          response: result,
          fromListMap: (mapList) =>
              mapList.map((e) => MachineryImplementModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<MachineryImplementModel>> getMachineryImplementById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.machineryImplementEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem(
          response: result,
          fromMap: MachineryImplementModel.fromMap,
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllMachineryImplementsToSelect(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.machineryImplementEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
