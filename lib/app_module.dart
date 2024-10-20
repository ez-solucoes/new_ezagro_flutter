import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client_shared_prefs_impl.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings.dart';
import 'package:new_ezagro_flutter/features/data/repositories/authentication_repository/authentication_repository_impl.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/authenticate_usecase/authenticate_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/recover_password_usecase/recover_password_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/authentication_usecases/recover_password_usecase/recover_password_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/executor_usecases/executor_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/executor_usecases/executor_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/machinery_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/machinery_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecases_impl.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/create_service_order_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/create_service_order_usecase_impl.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/recover_password_success_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/repeat_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/temp_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/username_input_page.dart';

import 'core/http_client/http_client.dart';
import 'core/http_client/http_client_dio_imp.dart';
import 'core/local_storage/local_storage_client_secure_impl.dart';
import 'features/data/datasources/Employee_datasources/Employee_datasource.dart';
import 'features/data/datasources/Product_datasources/Product_datasource.dart';
import 'features/data/datasources/activity_datasources/activity_datasource.dart';
import 'features/data/datasources/activity_datasources/activity_datasource_impl.dart';
import 'features/data/datasources/authentication_datasource/authentication_datasource.dart';
import 'features/data/datasources/authentication_datasource/authentication_datasources_impl.dart';
import 'features/data/datasources/cost_center_datasource/cost_center_datasource.dart';
import 'features/data/datasources/cost_center_datasource/cost_center_datasource_impl.dart';
import 'features/data/datasources/crop_datasource/crop_datasource.dart';
import 'features/data/datasources/crop_datasource/crop_datasource_impl.dart';
import 'features/data/datasources/employee_datasources/employee_datasource_impl.dart';
import 'features/data/datasources/executors_datasources/executors_datasource.dart';
import 'features/data/datasources/executors_datasources/executors_datasource_impl.dart';
import 'features/data/datasources/farm_datasource/farm_datasource.dart';
import 'features/data/datasources/farm_datasource/farm_datasource_impl.dart';
import 'features/data/datasources/machinery_datasources/machinery_datasource.dart';
import 'features/data/datasources/machinery_datasources/machinery_datasource_impl.dart';
import 'features/data/datasources/plots_datasource/plots_datasource.dart';
import 'features/data/datasources/plots_datasource/plots_datasource_impl.dart';
import 'features/data/datasources/product_datasources/product_datasource_impl.dart';
import 'features/data/datasources/service_order_datasources/service_order_datasource.dart';
import 'features/data/datasources/service_order_datasources/service_order_datasource_impl.dart';
import 'features/data/repositories/activity_repositories/activity_repository_impl.dart';
import 'features/data/repositories/cost_center_repositories/cost_center_repository_impl.dart';
import 'features/data/repositories/crop_repositories/crop_repository_impl.dart';
import 'features/data/repositories/employee_repositories/employee_repository_impl.dart';
import 'features/data/repositories/executors_repositories/executors_repository_impl.dart';
import 'features/data/repositories/farm_repositories/farm_repository_impl.dart';
import 'features/data/repositories/machinery_repositories/machinery_repository_impl.dart';
import 'features/data/repositories/plots_repositories/plots_repository_impl.dart';
import 'features/data/repositories/products_repositories/products_repository_impl.dart';
import 'features/data/repositories/service_order_repositories/service_order_repository_impl.dart';
import 'features/domain/repositories/activity_repository/activity_repository.dart';
import 'features/domain/repositories/cost_center_repositories/cost_center_repository.dart';
import 'features/domain/repositories/crop_repositories/crop_repository.dart';
import 'features/domain/repositories/employee_repositories/employee_repository.dart';
import 'features/domain/repositories/executors_repositories/executors_repository.dart';
import 'features/domain/repositories/farm_repositories/farm_repository.dart';
import 'features/domain/repositories/machinery_repositories/machinery_repository.dart';
import 'features/domain/repositories/plots_repositories/plots_repository.dart';
import 'features/domain/repositories/product_repositories/product_repository.dart';
import 'features/domain/repositories/service_order_repositories/service_order_repository.dart';
import 'features/domain/usecases/authentication_usecases/authenticate_usecase/authenticate_usecase.dart';
import 'features/domain/usecases/employee_usecase/employee_usecase.dart';
import 'features/domain/usecases/employee_usecase/employee_usecase_impl.dart';
import 'features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';
import 'features/domain/usecases/service_order_list_usecase/service_order_list_usecase_impl.dart';
import 'features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import 'features/presenter/modules/authentication_module/change_password_page/change_password_step_page.dart';
import 'features/presenter/modules/authentication_module/login_pages/login_page.dart';
import 'features/presenter/modules/authentication_module/register_page/register_fifth_step_page.dart';
import 'features/presenter/modules/authentication_module/register_page/register_first_step_page.dart';
import 'features/presenter/modules/authentication_module/register_page/register_fourth_step_page.dart';
import 'features/presenter/modules/authentication_module/register_page/register_second_step_page.dart';
import 'features/presenter/modules/authentication_module/register_page/register_third_step_page.dart';
import 'features/presenter/modules/documents/documents_page/documents_page.dart';
import 'features/presenter/modules/service_order/controller/create_service_order_controller/create_service_order_controller.dart';
import 'features/presenter/modules/service_order/create_service_order_page/create_service_order_page.dart';
import 'features/presenter/modules/service_order/service_order_list_page/service_order_list_page.dart';
import 'features/presenter/modules/service_order/service_order_page/service_order_page.dart';
import 'features/presenter/modules/splash/splash_page/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //Core Binds
    i.addLazySingleton<LocalStorageClient>(
        LocalStorageClientSharedPrefsImpl.new,
        key: AppStrings.storageTypeLocal);
    i.addLazySingleton<LocalStorageClient>(LocalStorageClientSecureImpl.new,
        key: AppStrings.storageTypeSecure);
    i.addLazySingleton<LogInterceptor>(LogInterceptor.new);
    i.addSingleton<HttpClient>(HttpClientDioImp.new);

    //Usecase
    i.addLazySingleton<AuthenticateUsecase>(AuthenticateUsecaseImpl.new);
    i.addLazySingleton<RecoverPasswordUsecase>(RecoverPasswordUsecaseImpl.new);
    i.addLazySingleton<ServiceOrderListUsecase>(
        ServiceOrderListUsecaseImpl.new);
    i.addLazySingleton<ActivityUsecase>(ActivityUsecaseImpl.new);
    i.addLazySingleton<CostCenterUsecase>(CostCenterUsecaseImpl.new);
    i.addLazySingleton<FarmUsecase>(FarmUsecaseImpl.new);
    i.addLazySingleton<CropUsecase>(CropUsecaseImpl.new);
    i.addLazySingleton<PlotsUsecase>(PlotsUsecaseImpl.new);
    i.addLazySingleton<ExecutorUsecase>(ExecutorUsecaseImpl.new);
    i.addLazySingleton<MachineryUsecase>(MachineryUsecaseImpl.new);
    i.addLazySingleton<ProductUsecase>(ProductUsecaseImpl.new);
    i.addLazySingleton<EmployeeUsecase>(EmployeeUsecaseImpl.new);
    i.addLazySingleton<CreateServiceOrderUsecase>(
        CreateServiceOrderUsecaseImpl.new);

    //Repository
    i.addLazySingleton<AuthenticationRepository>(
        AuthenticationRepositoryImpl.new);
    i.addLazySingleton<ServiceOrderRepository>(ServiceOrderRepositoryImpl.new);
    i.addLazySingleton<ActivityRepository>(ActivityRepositoryImpl.new);
    i.addLazySingleton<CostCenterRepository>(CostCenterRepositoryImpl.new);
    i.addLazySingleton<FarmRepository>(FarmRepositoryImpl.new);
    i.addLazySingleton<CropRepository>(CropRepositoryImpl.new);
    i.addLazySingleton<PlotsRepository>(PlotsRepositoryImpl.new);
    i.addLazySingleton<ExecutorsRepository>(ExecutorsRepositoryImpl.new);
    i.addLazySingleton<MachineryRepository>(MachineryRepositoryImpl.new);
    i.addLazySingleton<ProductRepository>(ProductRepositoryImpl.new);
    i.addLazySingleton<EmployeeRepository>(EmployeeRepositoryImpl.new);

    //Datasource
    i.addLazySingleton<AuthenticationDatasource>(
        AuthenticationDatasourceImpl.new);
    i.addLazySingleton<ServiceOrderDatasource>(ServiceOrderDatasourceImpl.new);
    i.addLazySingleton<ActivityDatasource>(ActivityDatasourceImpl.new);
    i.addLazySingleton<CostCenterDatasource>(CostCenterDatasourceImpl.new);
    i.addLazySingleton<FarmDatasource>(FarmDatasourceImpl.new);
    i.addLazySingleton<CropDatasource>(CropDatasourceImpl.new);
    i.addLazySingleton<PlotsDatasource>(PlotsDatasourceImpl.new);
    i.addLazySingleton<ExecutorsDatasource>(ExecutorsDatasourceImpl.new);
    i.addLazySingleton<MachineryDatasource>(MachineryDatasourceImpl.new);
    i.addLazySingleton<ProductDatasource>(ProductDatasourceImpl.new);
    i.addLazySingleton<EmployeeDatasource>(EmployeeDatasourceImpl.new);

    //Controllers
    i.addLazySingleton<AuthenticationController>(AuthenticationController.new);
    i.addLazySingleton<CreateServiceOrderController>(
        CreateServiceOrderController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.appDefaultPage, child: (context) => LoginPage());
    r.child(AppRoutes.appSplashPage, child: (context) => const SplashPage());

    r.child(AppRoutes.appLoginPage, child: (context) => LoginPage());
    r.child(AppRoutes.appUsernameInputPage,
        child: (context) => UsernameInputPage());
    r.child(AppRoutes.appTempPasswordPage,
        child: (context) => TempPasswordPage());
    r.child(AppRoutes.appRepeatPasswordPage,
        child: (context) => RepeatPasswordPage());
    r.child(AppRoutes.appRecoverPasswordSuccessPage,
        child: (context) => RecoverPasswordSuccessPage());

    r.child(AppRoutes.appRegisterFirstStepPage,
        child: (context) => const RegisterFirstStepPage());
    r.child(AppRoutes.appRegisterSecondStepPage,
        child: (context) => const RegisterSecondStepPage());
    r.child(AppRoutes.appRegisterThirdStepPage,
        child: (context) => const RegisterThirdStepPage());
    r.child(AppRoutes.appRegisterFourthStepPage,
        child: (context) => const RegisterFourthStepPage());
    r.child(AppRoutes.appRegisterFifthStepPage,
        child: (context) => const RegisterFifthStepPage());
    r.child(AppRoutes.appDocumentsPage,
        child: (context) => const DocumentsPage());
    r.child(AppRoutes.appChangePasswordFirstStepPage,
        child: (context) => const ChangePasswordStepPage());
    r.child(AppRoutes.appServiceOrderPage,
        child: (context) => const ServiceOrderPage());
    r.child(AppRoutes.appServiceOrderListPage,
        child: (context) => const ServiceOrderListPage());
    r.child(AppRoutes.appCreateServiceOrderPage,
        child: (context) => const CreateServiceOrderPage());
    super.routes(r);
  }
}
