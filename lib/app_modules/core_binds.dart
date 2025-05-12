import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/connection_manager/connection_status.dart';
import '../core/connection_manager/connection_status_impl.dart';
import '../core/http_client/http_client.dart';
import '../core/http_client/http_client_dio_imp.dart';
import '../core/local_storage/local_storage_client.dart';
import '../core/local_storage/local_storage_client_secure_impl.dart';
import '../core/local_storage/local_storage_client_shared_prefs_impl.dart';
import '../design_system/strings/app_strings_portuguese.dart';

class CoreBinds {
  void binds(Injector i) {
    //Core Binds
    i.addLazySingleton<LocalStorageClient>(LocalStorageClientSharedPrefsImpl.new,
        key: AppStringsPortuguese.storageTypeLocal);
    i.addLazySingleton<LocalStorageClient>(LocalStorageClientSecureImpl.new,
        key: AppStringsPortuguese.storageTypeSecure);
    i.addLazySingleton<LogInterceptor>(LogInterceptor.new);
    i.addSingleton<HttpClient>(HttpClientDioImp.new);
    i.addSingleton<ConnectionStatus>(ConnectionStatusImpl.new);
  }
}