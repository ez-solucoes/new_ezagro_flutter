import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/features/data/datasources/product_datasources/product_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';

import '../../../../core/mixins/uri_builder_mixin.dart';
import '../../../../core/usecase/usecase.dart';
import '../../models/pagination_model/pagination_model.dart';
import '../api_endpoints.dart';

class ProductDatasourceImpl with UriBuilder implements ProductDatasource {
  final HttpClient httpClient;

  ProductDatasourceImpl(this.httpClient);

  @override
  Future<PaginationModel<ProductModel>> getProducts(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.getProductsEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.status) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => PaginationModel.fromMap(map, ProductModel.fromMap),
          fromJson: (jsonString) =>
              PaginationModel.fromJson(jsonString, ProductModel.fromMap),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
