import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../consts/app_strings.dart';
import '../../modules/data/datasources/api_endpoints.dart';
import '../errors/authentication_error.dart';
import '../local_storage/local_storage_client_secure_impl.dart';

class AuthInterceptor extends Interceptor {
  /// The callback will be executed before the request is initiated.
  ///
  /// If you want to continue the request, call [handler.next].
  ///
  /// If you want to complete the request with some custom data，
  /// you can resolve a [Response] object with [handler.resolve].
  ///
  /// If you want to complete the request with an error message,
  /// you can reject a [DioException] object with [handler.reject].

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {

    bool isUnauthenticated =
    unauthenticatedRoutes.any((element) => options.uri.path == element);

    if (isUnauthenticated) {
      handler.next(options);
    } else {
      final sharedPreferencesInstance =
      Modular.tryGet<LocalStorageClientSecureImpl>();
      final authenticated =
      await sharedPreferencesInstance?.readData(AppStrings.tokenKey);
      if (authenticated != null && authenticated != '') {
        options.headers.putIfAbsent('Authorization', () => 'Bearer $authenticated');
        handler.next(options);
      } else {
        DioException error = DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: AuthenticationError(
            friendlyMessage: AppStrings.reautenticationNeededErrorMessage,
            causedBy: AppStrings.unauthenticatedUserErrorCausedBy,
            fingerprint: 'AuthInterceptor.onRequest',
            additionalInfo:
            'Trying to call [${options.method}] ${options.path}',
          ),
        );
        debugPrint(error.toString());
        handler.reject(error);
      }
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final responseStatusCode = err.response?.statusCode ?? 0;
    final requestPath = err.requestOptions.uri.path;
    final isUnauthenticated = _pathIsUnauthenticated(requestPath);
    final isUnauthorizedCode = [403,401].contains(responseStatusCode);

    if(!isUnauthenticated && isUnauthorizedCode) {
      return;
    }
    handler.next(err);
  }

  bool _pathIsUnauthenticated(String path) {
    return unauthenticatedRoutes.any((routePath) => routePath == path);
  }
}

List<String> get unauthenticatedRoutes => [
  AppEndpoints.authenticateEndpoint,
  AppEndpoints.firstAccessEndpoint,
  AppEndpoints.forgotPasswordEndpoint,
  AppEndpoints.validateTokenEndpoint
];
