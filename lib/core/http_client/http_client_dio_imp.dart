import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';

class HttpClientDioImp extends DioForNative implements HttpClient{
  HttpClientDioImp({
    BaseOptions? options,
}) : super(options) {

  }

  @override
  Future<HttpResponse> execute(HttpRequest request) {
    // TODO: implement execute
    throw UnimplementedError();
  }

}