import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_dio_imp.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client_secure_impl.dart';

import '../local_storage/local_storage_client.dart';

class CoreBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<HttpClient>(HttpClientDioImp.new);

    i.addSingleton<LocalStorageClient>(LocalStorageClientSecureImpl.new);

    i.addSingleton<LogInterceptor>(LogInterceptor.new);
    super.exportedBinds(i);
  }
}

//
// @override
// void exportedBinds(i) {
//   i.addSingleton<HttpClient>(HttpClientDioImp.new);
//
//   i.addSingleton<LocalStorageClient>(LocalStorageClientSecureImpl.new);
//
//   i.addSingleton<LogInterceptor>(LogInterceptor.new);
// }
