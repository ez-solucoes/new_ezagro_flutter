import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/api_endpoints.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/stock_datasources/stock_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/data/models/stock_models/stock_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/http_client/http_client_helper.dart';

class StockDatasourceImpl with UriBuilder implements StockDatasource {
  final HttpClient httpClient;

  StockDatasourceImpl(this.httpClient);

  @override
  Future<ResponseModel<List<StockModel>>> getAllStocks(NoParams noParams) async {
    final String url = mountUrl(
        AppEndpoints.baseUrlProtocolWithSecurity,
        AppEndpoints.mainBaseUrl,
        AppEndpoints.stockEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForPaginatedList<StockModel>(
          response: result,
          fromListMap: (map) => (map).map((e) => StockModel.fromMap(e)).toList(),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<List<SelectModel>>> getAllStocksToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.stockEndpoint + AppEndpoints.selectEndpoint,
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
  Future<ResponseModel<StockModel>> getStockById(ArgParams argParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.stockEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url, id: argParams.firstArgs);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<StockModel>(
          response: result,
          fromMap: (map) => StockModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}