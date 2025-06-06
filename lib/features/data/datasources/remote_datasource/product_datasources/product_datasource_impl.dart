import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/product_datasources/product_datasource.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/http_client/http_client.dart';
import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../models/products_models/product_model.dart';
import '../../../models/response_models/response_model.dart';
import '../../../models/select_models/select_model.dart';
import '../api_endpoints.dart';

class ProductDatasourceImpl with UriBuilder implements ProductDatasource {
  final HttpClient httpClient;

  ProductDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<List<ProductModel>>> getAllProducts(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<ProductModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => ProductModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllProductsToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<ProductModel>>> getAllProductsByTypeId(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: {'typeId': argParams.firstArgs.toString()});
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<ProductModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => ProductModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllProductsByTypeIdToSelect(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, queryParams: argParams.mountQueryParam(firstParamName: 'typeId'));
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<SelectModel>(
          response: result,
          fromListMap: (mapList) => mapList.map((e) => SelectModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<ProductModel>> getProductById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.productEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<ProductModel>(
          response: result,
          fromMap: (map) => ProductModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}