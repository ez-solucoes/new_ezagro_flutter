import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/get_purchase_request_by_status_id_usecases/get_purchase_request_by_status_id_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/get_all_service_order_by_status_id_usecase/get_all_service_order_by_status_id_usecase.dart';

import '../../../../core/local_storage/local_storage_client_secure_impl.dart';
import '../../../../design_system/strings/app_strings_portuguese.dart';


part'home_controller.g.dart';

class HomeController = HomeControllerAbstract with _$HomeController;

abstract class HomeControllerAbstract with Store {

  @observable
  int totalPurchases = 0;

  @observable
  int totalApprovals = 0;

  @observable
  int totalUrgentPurchases = 0;

  @observable
  int totalServiceOrders = 0;

  @observable
  bool isLoading = false;

  @observable
  String clientName = '';

  @action
  Future<void> getClientName() async {
    isLoading = true;

    final sharedPreferencesInstance =
    Modular.tryGet<LocalStorageClientSecureImpl>(key: AppStringsPortuguese.storageTypeSecure);
    final name =
    await sharedPreferencesInstance?.readData(AppStringsPortuguese.nameKey);
    if (name != null && name != '') {
      clientName = name;
    }

    isLoading = false;
  }

  @action
  Future<void> getPurchasesByStatusId(int purchaseStatusId) async {
    isLoading = true;

    final getPurchaseRequestByStatusIdUsecase = Modular.get<GetPurchaseRequestByStatusIdUsecase>();
    final result = await getPurchaseRequestByStatusIdUsecase(
        ArgParams(firstArgs: purchaseStatusId));
    result.fold((error) => error.friendlyMessage, (success) {
      totalPurchases = success.data!.length;

      calculateApprovals(totalPurchases, totalServiceOrders);
      return success;
    });

    isLoading = false;
  }

  @action
  Future<void> getServiceOrdersByStatusId(int serviceOrderStatusId) async {
    isLoading = true;

    final getAllServiceOrderByStatusIdUsecase = Modular.get<GetAllServiceOrderByStatusIdUsecase>();
    final result = await getAllServiceOrderByStatusIdUsecase(ArgParams(firstArgs: serviceOrderStatusId));
    result.fold((error) => error.friendlyMessage, (success) {
      totalServiceOrders = success.data!.length;

      calculateApprovals(totalPurchases, totalServiceOrders);
      return success;
    });

    isLoading = false;
  }

  @action
  int calculateApprovals(int totalPurchases, int totalServiceOrders) {

    if(totalApprovals != 0){
      totalApprovals = 0;
      return totalApprovals = totalPurchases + totalServiceOrders;
    } else {
      return totalApprovals = totalPurchases + totalServiceOrders;
    }
  }
}