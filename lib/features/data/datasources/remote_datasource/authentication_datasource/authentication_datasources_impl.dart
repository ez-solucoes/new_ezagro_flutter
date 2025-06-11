import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_helper.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/mixins/uri_builder_mixin.dart';
import 'package:new_ezagro_flutter/core/usecase/empty_result.dart';
import 'package:new_ezagro_flutter/features/data/datasources/remote_datasource/api_endpoints.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import '../../../../domain/params/authentication_params/authentication_params.dart';
import '../../../models/authentication_models/authentication_model.dart';
import 'authentication_datasource.dart';

class AuthenticationDatasourceImpl with UriBuilder implements AuthenticationDatasource {
  AuthenticationDatasourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<ResponseModel<AuthenticationModel>> authenticate(
      AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.authenticationLoginEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
      'password': authenticationParams.password,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 201:
        return mountResponseModelForSingleItem<AuthenticationModel>(
          response: result,
          fromMap: (map) => AuthenticationModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<EmptyResult> recoverPassword(AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.authenticationForgotPasswordEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 201:
        return EmptyResult();
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }

  @override
  Future<ResponseModel<AuthenticationModel>> updatePassword(AuthenticationParams authenticationParams) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.authenticationUpdatePasswordEndpoint,
    );

    final HttpRequest request = HttpRequest.post(path: url, payload: {
      'username': authenticationParams.username,
      'password': authenticationParams.password,
    });

    final result = await httpClient.execute(request);

    switch (result.statusCode) {
      case 200:
        return mountResponseModelForSingleItem<AuthenticationModel>(
          response: result,
          fromMap: (map) => AuthenticationModel.fromMap(map),
        );
      default:
        throw mountServerErrorInstance(request: request, response: result);
    }
  }
}
