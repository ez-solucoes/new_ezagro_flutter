import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/models/crop_models/crop_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';


import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/pagination_model/pagination_model.dart';
import '../api_endpoints.dart';
import 'crop_datasource.dart';

class CropDatasourceImpl with UriBuilder implements CropDatasource {
  final HttpClient httpClient;

  CropDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<PaginationModel<CropModel>>> getSimplifiedCrops(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getSimplifiedCropsEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, CropModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, CropModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
