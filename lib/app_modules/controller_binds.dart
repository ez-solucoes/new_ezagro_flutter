import 'package:flutter_modular/flutter_modular.dart';

import '../features/presenter/miscellaneous/edit_listed_items/edit_listed_items_controller.dart';
import '../features/presenter/miscellaneous/item_selection_controller.dart';
import '../features/presenter/miscellaneous/view_listed_itens/view_listed_items_controller.dart';
import '../features/presenter/modules/approvals_module/approvals_detail/approvals_detail_controller.dart';
import '../features/presenter/modules/approvals_module/approvals_list/approvals_list_controller.dart';
import '../features/presenter/modules/authentication_module/authentication_controller/authentication_controller.dart';
import '../features/presenter/modules/home/home_controller.dart';
import '../features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import '../features/presenter/modules/purchase_request/purchase_request_detail/purchase_request_detail_controller.dart';
import '../features/presenter/modules/purchase_request/purchase_request_list/purchase_request_list_controller.dart';
import '../features/presenter/modules/register/company/controller/company_controller.dart';
import '../features/presenter/modules/register/contracts/controller/contract_controller.dart';
import '../features/presenter/modules/register/employees/controller/employee_controller.dart';
import '../features/presenter/modules/register/farm/controller/farm_controller.dart';
import '../features/presenter/modules/register/machinery/machinery_controller.dart';
import '../features/presenter/modules/service_order/controller/create_service_order_controller/create_service_order_controller.dart';
import '../features/presenter/modules/service_order/controller/plots_list_controller/plots_list_controller.dart';
import '../features/presenter/modules/service_order/controller/service_order_controller/service_order_controller.dart';
import '../features/presenter/modules/service_order/controller/service_order_list_controller/service_order_list_controller.dart';
import '../features/presenter/modules/service_order/service_order_create/service_order_create_controller.dart';

class ControllerBinds {
  void binds(Injector i) {
    i.addLazySingleton<AuthenticationController>(AuthenticationController.new);
    i.addLazySingleton<CreateServiceOrderController>(CreateServiceOrderController.new);
    i.addLazySingleton<ServiceOrderListController>(ServiceOrderListController.new);
    i.addLazySingleton<ServiceOrderController>(ServiceOrderController.new);
    i.addLazySingleton<PlotsListController>(PlotsListController.new);
    i.addLazySingleton<CompanyController>(CompanyController.new);
    i.addLazySingleton<FarmController>(FarmController.new);
    i.addLazySingleton<EmployeeController>(EmployeeController.new);
    i.addLazySingleton<ContractController>(ContractController.new);
    i.addLazySingleton<MachineryController>(MachineryController.new);
    i.addLazySingleton<ApprovalsListController>(ApprovalsListController.new);
    i.addLazySingleton<ApprovalsDetailController>(ApprovalsDetailController.new);
    i.addLazySingleton<HomeController>(HomeController.new);

    i.addLazySingleton<ServiceOrderCreateController>(ServiceOrderCreateController.new);

    i.addLazySingleton<PurchaseRequestListController>(PurchaseRequestListController.new);
    i.addLazySingleton<PurchaseRequestDetailController>(PurchaseRequestDetailController.new);
    i.addLazySingleton<PurchaseRequestCreateController>(PurchaseRequestCreateController.new);

    //Miscellaneous
    i.addLazySingleton<EditListedItemsController>(EditListedItemsController.new);
    i.addLazySingleton<ViewListedItemsController>(ViewListedItemsController.new);
    i.addLazySingleton<ItemSelectionController>(ItemSelectionController.new);
  }
}