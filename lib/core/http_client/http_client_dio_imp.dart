import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';
import 'package:new_ezagro_flutter/core/interceptors/auth_interceptor.dart';

import 'http_error.dart';

class HttpClientDioImp extends DioForNative implements HttpClient {
  HttpClientDioImp({
    BaseOptions? options,
  }) : super(options) {
    interceptors.add(AuthInterceptor());
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  @override
  Future<HttpResponse> execute(HttpRequest request) async {
    try {
      late Response<dynamic> response;
      final requestOptions = Options(
        headers: request.headers,
      );
      switch (request.method) {
        case HttpRequestMethod.delete:
          response = await delete(
            request.path,
            queryParameters: request.queryParams,
            data: request.payload,
            options: requestOptions,
          );
          break;
        case HttpRequestMethod.get:
          response = await get(
            request.path,
            queryParameters: request.queryParams,
            options: requestOptions,
          );
          break;
        case HttpRequestMethod.patch:
          response = await patch(
            request.path,
            queryParameters: request.queryParams,
            data: request.payload,
            options: requestOptions,
          );
          break;
        case HttpRequestMethod.post:
          response = await post(
            request.path,
            queryParameters: request.queryParams,
            data: request.payload,
            options: requestOptions,
          );
          break;
        case HttpRequestMethod.put:
          response = await put(
            request.path,
            queryParameters: request.queryParams,
            data: request.payload,
            options: requestOptions,
          );
          break;
        default:
          throw UnimplementedError(
              '${request.method.name} is not implemented for this client. Feels bad bro. Good luck.');
      }
      return HttpResponse(
        statusCode: response.statusCode!,
        statusMessage: response.statusMessage,
        data: response.data,
      );
    } on DioException catch (dioError) {
      final HttpErrorType errorType;
      switch (dioError.type) {
        case DioExceptionType.badResponse:
          errorType = HttpErrorType.response;
          return HttpResponse(
            statusCode: dioError.response!.statusCode!,
            statusMessage: dioError.response?.statusMessage,
            data: dioError.response!.data,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          errorType = HttpErrorType.connection;
          break;
        default:
          errorType = HttpErrorType.other;
          break;
      }
      throw HttpError(
        type: errorType,
        message: dioError.message,
        request: request,
        response:
        HttpResponse(statusCode: dioError.response?.statusCode ?? 500),
        error: dioError,
      );
    } catch (error) {
      throw HttpError(
        type: HttpErrorType.other,
        message:
        'Unexpected error while executing ${request.method.name} ${request.path}\n${error.toString()}',
        request: request,
        error: error,
      );
    }
  }
}
