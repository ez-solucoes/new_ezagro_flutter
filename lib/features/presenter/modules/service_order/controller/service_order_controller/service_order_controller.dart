
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/field_service_order_entities/field_service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/get_service_order_by_id_usecase.dart';
part 'service_order_controller.g.dart';

class ServiceOrderController = ServiceOrderControllerAbstract with _$ServiceOrderController;

abstract class ServiceOrderControllerAbstract with Store {

  int serviceOrderId = 0;

  @observable
  bool isLoading = true;

  @observable
  FieldServiceOrderEntity? serviceOrder;


  @action
  Future getServiceOrder() async {
    isLoading = true;
    final getServiceOrder = Modular.get<GetServiceOrderByIdUsecase>();
    final result = await getServiceOrder(ArgParams(firstArgs: serviceOrderId));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrder = success;
      return success;
    });

    isLoading = false;
  }
}