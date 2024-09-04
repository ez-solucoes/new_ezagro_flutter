import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client.dart';
import 'package:new_ezagro_flutter/core/http_client/http_client_dio_imp.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client_secure_impl.dart';
import 'package:new_ezagro_flutter/features/data/datasources/service_order_list_datasources/service_order_list_datasource.dart';
import 'package:new_ezagro_flutter/features/data/datasources/service_order_list_datasources/service_order_list_datasource_impl.dart';
import 'package:new_ezagro_flutter/features/presenter/service_order_list_page/service_order_list_page.dart';
import 'features/presenter/service_order_page/service_order_page.dart';
import 'core/binds/core_binds.dart';
import 'modules/data/datasources/datasource_binds.dart';
import 'modules/data/repositories/repository_binds.dart';
import 'modules/domain/usecases/usecase_binds.dart';
import 'modules/presenter/features/change_password_page/change_password_step_page.dart';
import 'modules/presenter/features/documents_page/documents_page.dart';
import 'modules/presenter/features/login_page/login_page.dart';
import 'modules/presenter/features/register_page/register_fifth_step_page.dart';
import 'modules/presenter/features/register_page/register_first_step_page.dart';
import 'modules/presenter/features/register_page/register_fourth_step_page.dart';
import 'modules/presenter/features/register_page/register_second_step_page.dart';
import 'modules/presenter/features/register_page/register_third_step_page.dart';
import 'modules/presenter/splash_page/splash_page.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    CoreBinds(),
    DatasourceBinds(),
    RepositoryBins(),
    UsecaseBinds(),
  ];

  @override
  void routes(r) {
    r.child(AppRoutes.appDefaultPage, child: (context) => const ChangePasswordStepPage());
    r.child(AppRoutes.appSplashPage, child: (context) => const SplashPage());
    r.child(AppRoutes.appHomePage, child: (context) => LoginPage());
    r.child(AppRoutes.appRegisterFirstStepPage, child: (context) => const RegisterFirstStepPage());
    r.child(AppRoutes.appRegisterSecondStepPage, child: (context) => const RegisterSecondStepPage());
    r.child(AppRoutes.appRegisterThirdStepPage, child: (context) => const RegisterThirdStepPage());
    r.child(AppRoutes.appRegisterFourthStepPage, child: (context) => const RegisterFourthStepPage());
    r.child(AppRoutes.appRegisterFifthStepPage, child: (context) => const RegisterFifthStepPage());
    r.child(AppRoutes.appDocumentsPage, child: (context) => const DocumentsPage());
    r.child(AppRoutes.appChangePasswordFirstStepPage, child: (context) => const ChangePasswordStepPage());
    r.child(AppRoutes.appServiceOrderPage, child: (context) => const ServiceOrderPage());
    r.child(AppRoutes.appServiceOrderListPage, child: (context) => const ServiceOrderListPage());
  }

  @override
  void binds(i) {
    ///DatasourceClientsBind
    i.addInstance(LocalStorageClientSecureImpl.new);
    i.add<LocalStorageClientSecureImpl>(LocalStorageClientSecureImpl.new);
    i.addLazySingleton<LogInterceptor>(LogInterceptor.new);
    i.addSingleton<HttpClient>(HttpClientDioImp.new);

    ///DataSourceBinds
    i.addLazySingleton<ServiceOrderListDatasource>(ServiceOrderListDatasourceImpl.new);

    ///Repositories
    i.addLazySingleton<ServiceOrderListRepository(constructor)
  }

}
