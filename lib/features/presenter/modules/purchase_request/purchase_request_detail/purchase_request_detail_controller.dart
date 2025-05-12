import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../domain/usecases/purchase_request_usecases/get_purchase_request_by_id_usecases/get_purchase_request_by_id_usecase.dart';

part 'purchase_request_detail_controller.g.dart';

class PurchaseRequestDetailController = PurchaseRequestDetailControllerAbstract with _$PurchaseRequestDetailController;

abstract class PurchaseRequestDetailControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  PurchaseRequestEntity? purchaseRequestEntity;

  @action
  Future<void> getPurchaseRequestById(int id) async {
    isLoading = true;

    final getPurchaseRequestByIdUsecase = Modular.get<GetPurchaseRequestByIdUsecase>();
    final result = await getPurchaseRequestByIdUsecase(ArgParams(firstArgs: id));
    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequestEntity = success;
      return success;
    });
    isLoading = false;
  }
}
