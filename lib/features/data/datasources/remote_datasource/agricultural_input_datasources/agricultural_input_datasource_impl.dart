
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';

import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/response_models/response_model.dart';
import '../api_endpoints.dart';
import 'agricultural_input_datasource.dart';

class AgriculturalInputDatasourceImpl with UriBuilder implements AgriculturalInputDatasource {
  final HttpClient httpClient;

  AgriculturalInputDatasourceImpl({required this.httpClient});

  @override
  Future<ResponseModel<AgriculturalInputModel>> getAgriculturalInputById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<AgriculturalInputModel>(
          response: result,
          fromMap: (map) => AgriculturalInputModel.fromMap(map),
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<AgriculturalInputModel>>> getAllAgriculturalInputs(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint,
    );

    final Map<String, dynamic> queryParams = argParams.mountQueryParam(
      firstParamName: 'page',
      secondParamName: 'pageSize',
      thirdParamName: 'search',
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: queryParams);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<AgriculturalInputModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => AgriculturalInputModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllAgriculturalInputsToSelect(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint + AppEndpoints.selectEndpoint,
    );

    final Map<String, dynamic> queryParams = argParams.mountQueryParam(
      firstParamName: 'page',
      secondParamName: 'pageSize',
      thirdParamName: 'search',
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: queryParams);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<AgriculturalInputModel>>> getAllAgriculturalInputsByClassId(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint,
    );

    final Map<String, dynamic> queryParams = argParams.mountQueryParam(
      firstParamName: 'classId',
      secondParamName: 'page',
      thirdParamName: 'pageSize',
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: queryParams);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList(
          response: result,
          fromListMap: (mapList) =>
              mapList.map((e) => AgriculturalInputModel.fromMap(e)).toList(),

        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllAgriculturalInputsByClassIdToSelect(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.agriculturalInputEndpoint + AppEndpoints.selectEndpoint,
    );

    final Map<String, dynamic> queryParams = argParams.mountQueryParam(
      firstParamName: 'classId',
      secondParamName: 'page',
      thirdParamName: 'pageSize',
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: queryParams);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}