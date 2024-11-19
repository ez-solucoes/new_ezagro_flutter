import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';

import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../../models/pagination_model/pagination_model.dart';
import '../api_endpoints.dart';
import 'farm_datasource.dart';

class FarmDatasourceImpl with UriBuilder implements FarmDatasource {
  final HttpClient httpClient;

  FarmDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<FarmModel>> getSimplifiedFarms(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getFarmsSimplifiedEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, FarmModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, FarmModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<List<FarmModel>> getCostCenterFarmsById(String costCenterId) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getCostCenterFarmsEndpoint + costCenterId,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => (map['data'] as List<dynamic>).map((e) => FarmModel.fromMap(e)).toList(),
          fromJson: (jsonString) {
            final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
            final dataList = jsonMap['data'] as List;
            return dataList.map((item) => FarmModel.fromJson(item)).toList();
          }
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
