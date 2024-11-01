import 'package:new_ezagro_flutter/core/http_client/http_client.dart';

class HttpClientInstanceManager {
  HttpClientInstanceManager(this._instance);

  final HttpClient _instance;

  HttpClient? get instance => _instance;
}
