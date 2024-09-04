import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../domain/entities/service_order_list_entities/service_order_list_entity.dart';

part 'service_order_list_controller.g.dart';

class ServiceOrderListController = _ServiceOrderListController
    with _$ServiceOrderListController;

abstract class _ServiceOrderSimplifiedListingController with Store {
  @observable
  bool isLoading = false;

  @observable
  List<ServiceOrderListEntity> serviceOrderListEntities = ObservableList();


  @action
  Future getServiceOrderList() async {
    isLoading = true;

    final getServiceOrdersListUsecase = Modular.get<GetServiceOrderListUsecase>();
    final result = await getServiceOrderListUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrderListEntities = success;
      //salvar no database??
      return success;
    });

    isLoading = false;
  }
}
