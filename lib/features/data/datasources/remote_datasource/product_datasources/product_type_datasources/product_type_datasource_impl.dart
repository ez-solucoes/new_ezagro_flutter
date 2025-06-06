

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/api_endpoints.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/product_datasources/product_type_datasources/product_type_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_type_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../models/response_models/response_model.dart';

class ProductTypeDatasourceImpl with UriBuilder implements ProductTypeDatasource {
  final HttpClient httpClient;

  ProductTypeDatasourceImpl({required this.httpClient});

  @override
  Future<ResponseModel<List<ProductTypeModel>>> getAllProductTypes(NoParams noParams) async {
    final String url = mountUrl(
        AppEndpoints.baseUrlProtocolWithSecurity,
        AppEndpoints.mainBaseUrl,
        AppEndpoints.productTypeEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch(result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<ProductTypeModel>(
            response: result,
            fromListMap: (map) => (map).map((e) => ProductTypeModel.fromMap(e)).toList(),
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllProductTypesToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productTypeEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch(result.statusCode) {
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
  Future<ResponseModel<ProductTypeModel>> getProductTypeById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productTypeEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch(result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<ProductTypeModel>(
          response: result,
          fromMap: (map) => ProductTypeModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}