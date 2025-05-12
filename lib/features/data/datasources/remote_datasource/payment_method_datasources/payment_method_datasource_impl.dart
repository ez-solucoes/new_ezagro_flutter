import 'dart:convert';

import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/payment_method_datasources/payment_method_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import '../../../../../core/http_client/http_client_helper.dart';
import '../../../../../core/http_client/http_request.dart';
import '../api_endpoints.dart';

class PaymentMethodDatasourceImpl with UriBuilder implements PaymentMethodDatasource {
  final HttpClient httpClient;

  PaymentMethodDatasourceImpl({required this.httpClient});

  @override
  Future<List<SelectModel>> getAllPaymentMethodsToSelect(NoParams noParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.paymentMethodEndpoint + AppEndpoints.selectEndpoint,
    );

    final HttpRequest request = HttpRequest.get(path: url);
    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountListModelInstanceFromResponse(
          response: result,
          fromListMap: (map) => (map).map((e) => SelectModel.fromMap(e)).toList(),
          fromJsonList: (jsonString) {
            final List<dynamic> jsonList = jsonDecode(jsonString);
            return jsonList.map((json) => SelectModel.fromJson(jsonEncode(json))).toList();
          },
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

}