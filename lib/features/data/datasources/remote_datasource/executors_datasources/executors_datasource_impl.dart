import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';

import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../api_endpoints.dart';
import 'executors_datasource.dart';

class ExecutorsDatasourceImpl with UriBuilder implements ExecutorsDatasource {
  final HttpClient httpClient;

  ExecutorsDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<EmployeeModel>> getExecutors(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getExecutorsEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, EmployeeModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, EmployeeModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
