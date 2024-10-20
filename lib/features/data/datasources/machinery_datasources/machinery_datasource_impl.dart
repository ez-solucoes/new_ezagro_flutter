import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/machine_implement_models/machine_implement_model.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../api_endpoints.dart';
import '../../models/pagination_model/pagination_model.dart';
import 'machinery_datasource.dart';

class MachineryDatasourceImpl with UriBuilder implements MachineryDatasource {

  final HttpClient httpClient;

  MachineryDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<MachineImplementModel>> getMachinery(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getMachineryEndpoint,
    );

    final HttpRequest request = HttpRequest.get( path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, MachineImplementModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, MachineImplementModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }

  }
}