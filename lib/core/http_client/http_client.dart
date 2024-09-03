import 'package:new_ezagro_flutter/core/http_client/http_request.dart';
import 'package:new_ezagro_flutter/core/http_client/http_response.dart';

abstract class HttpClient {
  Future<HttpResponse> execute(HttpRequest request);
}