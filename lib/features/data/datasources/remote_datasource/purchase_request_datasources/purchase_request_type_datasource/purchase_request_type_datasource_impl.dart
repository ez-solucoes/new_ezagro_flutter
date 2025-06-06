import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/purchase_request_datasources/purchase_request_type_datasource/purchase_request_type_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/type_models/type_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/http_client/http_client_helper.dart';
import '../../../../../../core/http_client/http_request.dart';
import '../../../../models/response_models/response_model.dart';
import '../../api_endpoints.dart';

class PurchaseRequestTypeDatasourceImpl
    with UriBuilder
    implements PurchaseRequestTypeDatasource {
  final HttpClient httpClient;

  PurchaseRequestTypeDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<List<SelectModel>>> getAllPurchaseRequestTypesToSelect(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequestTypeEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<TypeModel>>> getAllPurchaseRequestTypes(
      NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequestTypeEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<TypeModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => TypeModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<TypeModel>> getPurchaseRequestTypesById(
      ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.purchaseRequestTypeEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);
    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<TypeModel>(
          response: result,
          fromMap: (map) => TypeModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
