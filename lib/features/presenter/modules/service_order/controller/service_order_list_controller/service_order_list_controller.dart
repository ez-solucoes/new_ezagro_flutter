import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/service_order_list_usecase.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../design_system/colors/app_colors.dart';
import '../../../../../domain/entities/service_order_entities/service_order_entity.dart';
part 'service_order_list_controller.g.dart';

class ServiceOrderListController = ServiceOrderListControllerAbstract with _$ServiceOrderListController;

abstract class ServiceOrderListControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  List<ServiceOrderEntity> serviceOrderListEntities = ObservableList();

  @observable
  String searchText = "";

  @observable
  List<ServiceOrderEntity> filteredServiceOrders = ObservableList();


  @action
  Future getServiceOrderList() async {
    isLoading = true;
    final getServiceOrdersListUsecase = Modular.get<ServiceOrderListUsecase>();
    final result = await getServiceOrdersListUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      // serviceOrderListEntities = success.content!;
      filteredServiceOrders = serviceOrderListEntities;
      return success;
    });

    isLoading = false;
  }

  filterSOList(String searchText) {
    if(searchText == "") {
      filteredServiceOrders = serviceOrderListEntities;
    } else {
     filteredServiceOrders = serviceOrderListEntities.where(
              (so) => (
                     so.id.toString().contains(searchText)
                  // || (so.costCenterName ?? "").toLowerCase().contains(searchText)
                  // || (so.farmName ?? "").toLowerCase().contains(searchText)
                  // || (so.activityName ?? "").toLowerCase().contains(searchText)
                  // || ServiceOrderTypeEnumExtension.enumServiceOrderTypeToString(ServiceOrderTypeEnumExtension.getEnumServiceOrderTypeFromString(so.status)).toLowerCase().contains(searchText)
                  // || (so.activityStart ?? "").toLowerCase().contains(searchText)
                  // || (so.activityEnd ?? "").toLowerCase().contains(searchText)
              )).toList();
    }
  }

  Color getBackgroundColor(ServiceOrderTypeEnum status) {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.primaryGreenColor;
      default:
        return AppColors.primaryWhiteColor;

    }
  }

  Color getTextColor(ServiceOrderTypeEnum status) {
    switch(status) {
      case ServiceOrderTypeEnum.finished:
        return AppColors.primaryWhiteColor;
      default:
        return AppColors.primaryBlackColor;
    }
  }

  Color getBorderColor(ServiceOrderTypeEnum status) {
    switch (status) {
      case ServiceOrderTypeEnum.toBeStarted:
        return AppColors.borderWhiteColor;
      case ServiceOrderTypeEnum.onGoing:
        return AppColors.primaryGreenColor;
      case ServiceOrderTypeEnum.paused:
        return AppColors.darkGreyColor;
      case ServiceOrderTypeEnum.finished:
        return AppColors.borderWhiteColor;
      case ServiceOrderTypeEnum.approvalPending:
        return AppColors.muddyYellowColor;
      case ServiceOrderTypeEnum.canceled:
        return AppColors.primaryRedColor;
    }

  }
}
