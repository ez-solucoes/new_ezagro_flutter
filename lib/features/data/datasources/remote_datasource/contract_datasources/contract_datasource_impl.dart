import 'dart:convert';
import '../../../../../core/http_client/http_client.dart';
import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/contract_models/contract_model.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'contract_datasource.dart';

class ContractDatasourceImpl with UriBuilder implements ContractDatasource {
  final HttpClient httpClient;

  ContractDatasourceImpl(this.httpClient);

  @override
  Future<List<ContractModel>> getContracts(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getContractListEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => ContractModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => ContractModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ContractModel>> getContractById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getContractByIdEndpoint + (argParams.firstArgs as String),
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => ContractModel.fromMap(map),
          fromJson: (jsonString) => ContractModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
