import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/enums/service_order_type_enum.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';
import '../../../../../../consts/app_colors.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../../../core/local_storage/local_storage_client_secure_impl.dart';
import '../../../../../../core/local_storage/local_storage_item.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/service_order_list_entities/service_order_list_entity.dart';
part 'service_order_list_controller.g.dart';

class ServiceOrderListController = _ServiceOrderListController with _$ServiceOrderListController;

abstract class _ServiceOrderListController with Store {
  @observable
  bool isLoading = false;

  @observable
  List<ServiceOrderListEntity> serviceOrderListEntities = ObservableList();

  @observable
  String searchText = "";

  @observable
  List<ServiceOrderListEntity> filteredServiceOrders = ObservableList();


  @action
  Future getServiceOrderList() async {
    isLoading = true;
    await _writeToken();
    final getServiceOrdersListUsecase = Modular.get<ServiceOrderListUsecase>();
    final result = await getServiceOrdersListUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrderListEntities = success.content;
      filteredServiceOrders = serviceOrderListEntities;
      return success;
    });

    isLoading = false;
  }

  Future<void> _writeToken() async {
    final storage = Modular.get<LocalStorageClientSecureImpl>();
    String? token = await storage.readData(AppStrings.tokenKey);
    if (token != null) {
      await storage.deleteData(AppStrings.tokenKey);
    }
    await storage.writeData(LocalStorageItem(key: AppStrings.tokenKey, value: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMTExMTExMTExMSIsImV4cCI6MTcyNzE4MzQwMiwiaWF0IjoxNzI3MDk3MDAyfQ.cY7cWJbH2UGeR8Oni-bW-IbBztdQCcLp4swVFGyn4PnUqWffe26yBhiD6YVMrBIUVp_TD05RRrdM-kjIC7TSNg'));
  }

  filterSOList(String searchText) {
    if(searchText == "") {
      filteredServiceOrders = serviceOrderListEntities;
    } else {
      filteredServiceOrders = serviceOrderListEntities.where(
              (so) => (
                     so.id.toString().contains(searchText)
                  || so.costCenterName.toLowerCase().contains(searchText)
                  || so.farmName.toLowerCase().contains(searchText)
                  || so.activityName.toLowerCase().contains(searchText)
                  || ServiceOrderTypeEnumExtension.enumServiceOrderTypeToString(ServiceOrderTypeEnumExtension.getEnumServiceOrderTypeFromString(so.status)).toLowerCase().contains(searchText)
                  || so.activityStart.toLowerCase().contains(searchText)
                  || so.activityEnd.toLowerCase().contains(searchText)
              )).toList();
    }
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
