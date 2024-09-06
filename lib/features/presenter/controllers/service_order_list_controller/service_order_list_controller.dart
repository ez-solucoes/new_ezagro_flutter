import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';

import '../../../../consts/app_colors.dart';
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


  Color getBackgroundColor(ServiceOrderTypeEnum status) {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.greenColor;
      default:
        return AppColors.trueWhiteColor;

    }
  }

  Color getTextColor(ServiceOrderTypeEnum status) {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.trueWhiteColor;
      default:
        return AppColors.blackColor;
    }
  }

  Color getBorderColor(ServiceOrderTypeEnum status) {
    switch (status) {
      case ServiceOrderTypeEnum.toBeStarted:
        return AppColors.contourWhiteColor;
      case ServiceOrderTypeEnum.onGoing:
        return AppColors.greenColor;
      case ServiceOrderTypeEnum.paused:
        return AppColors.darkGreyColor;
      case ServiceOrderTypeEnum.finished:
        return AppColors.contourWhiteColor;
      case ServiceOrderTypeEnum.approvalPending:
        return AppColors.muddyYellowColor;
      case ServiceOrderTypeEnum.canceled:
        return AppColors.redCanceledColor;
    }

  }
}
