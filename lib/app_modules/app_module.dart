import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/app_modules/repository_binds.dart';
import 'package:new_ezagro_flutter/app_modules/usecase_binds.dart';
import 'package:new_ezagro_flutter/consts/app_routes.dart';
import 'package:new_ezagro_flutter/core/connection_manager/connection_status.dart';
import 'package:new_ezagro_flutter/core/connection_manager/connection_status_impl.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_client_shared_prefs_impl.dart';
import 'package:new_ezagro_flutter/design_system/strings/app_strings_portuguese.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/edit_listed_items/edit_listed_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/miscellaneous/item_selection_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/recover_password_success_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/repeat_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/temp_password_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/authentication_module/recover_password_pages/username_input_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/home/home_screen.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/contracts/contract_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/employees/employees_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/farm/farm_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/register/machinery/machinery_list_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/service_order/service_order_page/plots_list_page.dart';
import '../core/http_client/http_client.dart';
import '../core/http_client/http_client_dio_imp.dart';
import '../core/local_storage/local_storage_client_secure_impl.dart';
import '../features/presenter/miscellaneous/view_listed_itens/view_listed_items_page.dart';
import '../features/presenter/modules/approvals_module/approvals_detail/approvals_purchase_request_detail_page.dart';
import '../features/presenter/modules/approvals_module/approvals_detail/approvals_service_order_detail_page.dart';
import '../features/presenter/modules/approvals_module/approvals_list/approvals_list_page.dart';
import '../features/presenter/modules/authentication_module/login_pages/login_page.dart';
import '../features/presenter/modules/authentication_module/recover_password_pages/new_password_page.dart';
import '../features/presenter/modules/authentication_module/register_page/register_fifth_step_page.dart';
import '../features/presenter/modules/authentication_module/register_page/register_first_step_page.dart';
import '../features/presenter/modules/authentication_module/register_page/register_fourth_step_page.dart';
import '../features/presenter/modules/authentication_module/register_page/register_second_step_page.dart';
import '../features/presenter/modules/authentication_module/register_page/register_third_step_page.dart';
import '../features/presenter/modules/documents/documents_page/documents_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_add_items_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_delivery_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_general_info_first_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_list_items_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_payment_method_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_detail/purchase_request_detail_page.dart';
import '../features/presenter/modules/purchase_request/purchase_request_list/purchase_request_list_page.dart';
import '../features/presenter/modules/register/company/company_list_page.dart';
import '../features/presenter/modules/register/company/company_page.dart';
import '../features/presenter/modules/register/contracts/contract_page.dart';
import '../features/presenter/modules/register/employees/employee_page.dart';
import '../features/presenter/modules/register/farm/farm_page.dart';
import '../features/presenter/modules/register/machinery/machinery_implements_page.dart';
import '../features/presenter/modules/register/registers_page.dart';
import '../features/presenter/modules/service_order/create_service_order_page/create_service_order_page.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_general_info_first_page.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_general_info_second_page.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_origin_transfers_page.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_plot_add_page.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_plot_list_page.dart';
import '../features/presenter/modules/service_order/service_order_list_page/service_order_list_page.dart';
import '../features/presenter/modules/service_order/service_order_page/service_order_page.dart';
import '../features/presenter/modules/splash/splash_page/splash_page.dart';
import 'controller_binds.dart';
import 'datasource_binds.dart';

class AppModule extends Module {

  @override
  void binds(Injector i) {

    //Core Binds
    i.addLazySingleton<LocalStorageClient>(LocalStorageClientSharedPrefsImpl.new,
        key: AppStringsPortuguese.storageTypeLocal);
    i.addLazySingleton<LocalStorageClient>(LocalStorageClientSecureImpl.new,
        key: AppStringsPortuguese.storageTypeSecure);
    i.addLazySingleton<LogInterceptor>(LogInterceptor.new);
    i.addSingleton<HttpClient>(HttpClientDioImp.new);
    i.addSingleton<ConnectionStatus>(ConnectionStatusImpl.new);

    //UseCases
    UsecaseBinds().binds(i);

    //Repositories
    RepositoryBinds().binds(i);

    //Datasources
    DatasourceBinds().binds(i);

    //Controllers
    ControllerBinds().binds(i);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.appDefaultPage, child: (context) => ServiceOrderCreateGeneralInfoFirstPage());
    r.child(AppRoutes.appSplashPage, child: (context) => const SplashPage());
    r.child(AppRoutes.appLoginPage, child: (context) => LoginPage());
    r.child(AppRoutes.appRegistersPage, child: (context) => RegistersPage());
    r.child(AppRoutes.appUsernameInputPage, child: (context) => UsernameInputPage());
    r.child(AppRoutes.appTempPasswordPage, child: (context) => TempPasswordPage());
    r.child(AppRoutes.appRepeatPasswordPage, child: (context) => RepeatPasswordPage());
    r.child(AppRoutes.appNewPasswordPage, child: (context) => NewPasswordPage());
    r.child(AppRoutes.appRecoverPasswordSuccessPage, child: (context) => RecoverPasswordSuccessPage());
    r.child(AppRoutes.appRegisterFirstStepPage, child: (context) => const RegisterFirstStepPage());
    r.child(AppRoutes.appRegisterSecondStepPage, child: (context) => const RegisterSecondStepPage());
    r.child(AppRoutes.appRegisterThirdStepPage, child: (context) => const RegisterThirdStepPage());
    r.child(AppRoutes.appRegisterFourthStepPage, child: (context) => const RegisterFourthStepPage());
    r.child(AppRoutes.appRegisterFifthStepPage, child: (context) => const RegisterFifthStepPage());
    r.child(AppRoutes.appDocumentsPage, child: (context) => const DocumentsPage());
    r.child(AppRoutes.appHomePage, child: (context) => const HomePage());
    r.child(AppRoutes.appHomeScreen, child: (context) => const HomeScreen());
    r.child(AppRoutes.appServiceOrderPage, child: (context) => ServiceOrderPage(args: r.args.data,));
    r.child(AppRoutes.appServiceOrderListPage, child: (context) => const ServiceOrderListPage());
    r.child(AppRoutes.appPlotsList, child : (context) => PlotsListPage());
    r.child(AppRoutes.appCreateServiceOrderPage, child: (context) => const CreateServiceOrderPage());
    r.child(AppRoutes.appCompanyListPage, child: (context) => CompanyListPage());
    r.child(AppRoutes.appCompanyPage, child: (context) => CompanyPage(args: r.args.data,));
    r.child(AppRoutes.appContractListPage, child: (context) => ContractListPage());
    r.child(AppRoutes.appContractPage, child: (context) => ContractPage(args: r.args.data,));
    r.child(AppRoutes.appEmployeesListPage, child: (context) => EmployeesListPage());
    r.child(AppRoutes.appEmployeePage, child: (context) => EmployeePage(args: r.args.data,));
    r.child(AppRoutes.appFarmListPage, child: (context) => FarmListPage());
    r.child(AppRoutes.appFarmPage, child: (context) => FarmPage(args: r.args.data,));
    r.child(AppRoutes.appMachineryListPage, child: (context) => MachineryListPage());
    r.child(AppRoutes.appMachineryPage, child: (context) => MachineryImplementsPage(args: r.args.data,));
    r.child(AppRoutes.appApprovalsListPage, child: (context) => ApprovalsListPage());
    r.child(AppRoutes.appApprovalsPurchaseRequestDetailPage, child: (context) => ApprovalsPurchaseRequestDetailPage(args: r.args.data,));
    r.child(AppRoutes.appApprovalsServiceOrderDetailPage, child: (context) => ApprovalsServiceOrderDetailPage(args: r.args.data,));

    r.child(AppRoutes.appPurchaseRequestListPage, child: (context) => PurchaseRequestListPage());
    r.child(AppRoutes.appPurchaseRequestDetailPage, child: (context) => PurchaseRequestDetailPage(args: r.args.data,));
    r.child(AppRoutes.appPurchaseRequestCreateGeneralInfoFirstPage, child: (context) => PurchaseRequestCreateGeneralInfoFirstPage());
    r.child(AppRoutes.appPurchaseRequestCreateListItemsPage, child: (context) => PurchaseRequestCreateListItemsPage(args: r.args.data,));
    r.child(AppRoutes.addPurchaseRequestCreateAddItemsPage, child: (context) => PurchaseRequestCreateAddItemsPage(args: r.args.data,));
    r.child(AppRoutes.addPurchaseRequestCreatePaymentMethodPage, child: (context) => PurchaseRequestCreatePaymentMethodPage());
    r.child(AppRoutes.appPurchaseRequestCreateDeliveryPage, child: (context) => PurchaseRequestCreateDeliveryPage());

    r.child(AppRoutes.appServiceOrderCreateGeneralInfoFirstPage, child: (context) => ServiceOrderCreateGeneralInfoFirstPage());
    r.child(AppRoutes.appServiceOrderCreateGeneralInfoSecondPage, child: (context) => ServiceOrderCreateGeneralInfoSecondPage());
    r.child(AppRoutes.appServiceOrderCreatePlotListPage, child: (context) => ServiceOrderCreatePlotListPage());
    r.child(AppRoutes.appServiceOrderCreatePlotAddPage, child: (context) => ServiceOrderCreatePlotAddPage());
    r.child(AppRoutes.appServiceOrderCreateOriginTransfersPage, child: (context) => ServiceOrderCreateOriginTransfersPage());

    //Miscellaneous
    r.child(AppRoutes.appEditListedItemsPage, child: (context) => EditListedItemsPage(args: r.args.data,));
    r.child(AppRoutes.appViewListedItemsPage, child: (context) => ViewListedItemsPage(args: r.args.data,));
    super.routes(r);
  }
}