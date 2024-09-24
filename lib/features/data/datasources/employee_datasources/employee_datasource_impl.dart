import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../modules/data/datasources/api_endpoints.dart';
import '../../models/mock_model/mock_model.dart';
import '../../models/paginatino_model/pagination_model.dart';
import 'employee_datasource.dart';

class EmployeeDatasourceImpl with UriBuilder implements EmployeeDatasource {

  final HttpClient httpClient;

  EmployeeDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<MockModel>> getEmployees(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.getEmployees,
    );

    final HttpRequest request = HttpRequest.get( path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) =>
              PaginationModel.fromMap(map, MockModel.fromMap),
          fromJson: (jsonString) => PaginationModel.fromJson(
              jsonString, MockModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }

  }
}