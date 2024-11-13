import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';
import 'package:new_ezagro_flutter/features/data/datasources/api_endpoints.dart';

import '../../../domain/params/authentication_params/authentication_params.dart';
import '../../models/authentication_models/authentication_model.dart';
import 'authentication_datasource.dart';

class AuthenticationDatasourceImpl with UriBuilder implements AuthenticationDatasource {
  AuthenticationDatasourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future authenticate(AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.authenticateEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
      'password': authenticationParams.password,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => AuthenticationModel.fromMap(map),
          fromJson: (jsonString) => AuthenticationModel.fromJson(jsonString),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future recoverPassword(AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.recoverPasswordEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 204:
        return EmptyResult();
      default:
        mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future updatePassword(AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrlDev,
      AppEndpoints.updatePasswordEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
      'password': authenticationParams.password,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountModelInstanceFromResponse(
          response: result,
          fromMap: (map) => AuthenticationModel.fromMap(map),
          fromJson: (jsonString) => AuthenticationModel.fromJson(jsonString),
        );
        default:
          throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
