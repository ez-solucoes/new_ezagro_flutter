import 'dart:convert';
import '../../../../../core/http_client/http_client.dart';
import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/company_models/company_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'company_datasource.dart';

class CompanyDatasourceImpl with UriBuilder implements CompanyDatasource {
  final HttpClient httpClient;

  CompanyDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<List<CompanyModel>>> getAllCompanies(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getCompanyListEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => (map as List<dynamic>).map((e) => CompanyModel.fromMap(e)).toList(),
          fromJson: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => CompanyModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
