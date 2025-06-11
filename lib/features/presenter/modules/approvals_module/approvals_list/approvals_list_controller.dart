import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/get_all_service_order_by_status_id_usecase/get_all_service_order_by_status_id_usecase.dart';

import '../../../../domain/entities/service_order_entities/service_order_entity.dart';
import '../../../../domain/usecases/purchase_request_usecases/get_purchase_request_by_status_id_usecases/get_purchase_request_by_status_id_usecase.dart';
part 'approvals_list_controller.g.dart';

class ApprovalsListController = ApprovalsListControllerAbstract with _$ApprovalsListController;

abstract class ApprovalsListControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  int pageIndex = 0;

  @observable
  List<ServiceOrderEntity> serviceOrderListEntities = ObservableList();

  @observable
  List<PurchaseRequestEntity> purchaseRequestListEntities = ObservableList();

  @observable
  bool isChecked = false;

  @observable
  List<bool> checkboxStates = ObservableList();

  @action
  Future<void> getServiceOrderByStatusId(String serviceOrderStatusId) async {
    isLoading = true;
    final getAllServiceOrderByStatusIdUsecase = Modular.get<GetAllServiceOrderByStatusIdUsecase>();
    final result =
        await getAllServiceOrderByStatusIdUsecase(ArgParams(firstArgs: serviceOrderStatusId));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrderListEntities = success.data!;
      return success;
    });

    isLoading = false;
  }

  @action
  Future<void> getPurchaseRequestByStatusId(String purchaseRequestStatusId) async {
    isLoading = true;
    final getPurchaseRequestByStatusIdUsecase = Modular.get<GetPurchaseRequestByStatusIdUsecase>();
    final result =
        await getPurchaseRequestByStatusIdUsecase(ArgParams(firstArgs: purchaseRequestStatusId));
    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequestListEntities = success.data!;
      return success;
    });

    isLoading = false;
  }
}
