import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/get_all_purchase_request_usecases/get_all_purchase_request_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/purchase_request_entities/purchase_request_entity.dart';

part 'purchase_request_list_controller.g.dart';

class PurchaseRequestListController = PurchaseRequestListControllerAbstract with _$PurchaseRequestListController;

abstract class PurchaseRequestListControllerAbstract with Store {

  @observable
  bool isLoading = false;

  @observable
  bool isUrgent = false;

  @observable
  bool hasErrorInQuotationItem = false;

  @observable
  List<PurchaseRequestEntity> purchaseRequestListEntities = ObservableList();

  @action
  Future<void> getAllPurchaseRequests() async {
    isLoading = true;
    final getAllPurchaseRequestUsecase = Modular.get<GetAllPurchaseRequestUsecase>();
    final result = await getAllPurchaseRequestUsecase(NoParams());

    result.fold((error) => error.friendlyMessage, (success){
      purchaseRequestListEntities = success;
      return success;

    });
    isLoading = false;

  }
}