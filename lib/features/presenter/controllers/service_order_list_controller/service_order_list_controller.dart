import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../domain/entities/service_order_list_entities/service_order_list_entity.dart';

part 'service_order_list_controller.g.dart';

class ServiceOrderListController = _ServiceOrderListController with _$ServiceOrderListController;

abstract class _ServiceOrderListController with Store {
  @observable
  bool isLoading = false;

  @observable
  List<ServiceOrderListEntity> serviceOrderListEntities = ObservableList();


  @action
  Future getServiceOrderList() async {
    isLoading = true;

    final getServiceOrdersListUsecase = Modular.get<ServiceOrderListUsecase>();
    final result = await getServiceOrdersListUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrderListEntities = success;
      return success;
    });

    isLoading = false;
  }
}
