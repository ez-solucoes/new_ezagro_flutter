import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/utils/datetime_formatter.dart';
import 'package:new_ezagro_flutter/features/domain/entities/items_entities/items_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/send_purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/get_all_cost_centers_to_select_usecases/get_all_cost_centers_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/employee_usecase/get_all_employees_by_farm_id_to_select_usecases/get_all_employees_by_farm_id_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/purchase_request_delivery_location_usecases/get_all_purchase_request_delivery_locations_to_select_usecases/get_all_purchase_request_delivery_locations_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/purchase_request_type_usecases/get_all_purchase_request_type_to_select_usecases/get_all_purchase_request_types_to_select_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/params/arg_params/arg_params.dart';



import '../../../../domain/usecases/cost_center_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecase.dart';
import '../../../../domain/usecases/farm_usecases/get_all_farms_by_cost_center_id_to_select_usecases/get_all_farms_by_cost_center_id_to_select_usecase.dart';
import '../../../../domain/usecases/payment_method_usecases/get_all_payment_methods_to_select_usecase/get_all_payment_methods_to_select_usecase.dart';
import '../../../../domain/usecases/purchase_request_usecases/create_purchase_request_usecases/create_purchase_request_usecase.dart';


part 'purchase_request_create_controller.g.dart';

class PurchaseRequestCreateController = PurchaseRequestCreateControllerAbstract with _$PurchaseRequestCreateController;

abstract class PurchaseRequestCreateControllerAbstract with Store {
  @observable
  bool isFirstLoading = false;
  @observable
  bool isCostCenterLoading = false;
  @observable
  bool isFarmLoading = false;
  @observable
  bool isEmployeeLoading = false;
  @observable
  bool isPaymentMethodLoading = false;

  @observable
  List<SelectEntity> purchaseRequestTypeListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> costCenterListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> costCenterByCostCenterTypeIdListToSelect = ObservableList();
  @observable
  List<SelectEntity> farmsByCostCenterIdListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> employeeByFarmIdListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> paymentMethodListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> deliveryLocationListToSelect = ObservableList<SelectEntity>();

  SelectEntity? employee;
  @observable
  SelectEntity? purchaseRequestType;
  @observable
  SelectEntity? costCenter;
  @observable
  SelectEntity? farm;
  @observable
  SelectEntity? paymentMethod;

  @observable
  bool isUrgent = false;

  @observable
  String quotationExpirationDate = '';
  @observable
  String paymentDate = '';

  @observable
  SelectEntity? deliveryLocationId;

  @observable
  List<ItemsEntity> finalRequestedProducts = ObservableList<ItemsEntity>();
  @observable
  List<SelectEntity> finalRequestedCompanies = ObservableList<SelectEntity>();
  @observable
  List<ItemsEntity> finalRequestedAgriculturalInputs = ObservableList<ItemsEntity>();

  @action
  void initializeDates(){
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateTime now = DateTime.now();
    final String formattedDate = dateFormat.format(now);
    quotationExpirationDate = formattedDate;
    paymentDate = formattedDate;
  }

  @action
  void updateCostCenterAndReload(SelectEntity costCenter) {
    this.costCenter = costCenter;
    farm = null;
    farmsByCostCenterIdListToSelect.clear();
    getAllFarmsByCostCenterIdToSelect(costCenter.value);
  }

  @action
  void updateFarmAndReload(SelectEntity farm) {
    this.farm = farm;
    employee = null;
    employeeByFarmIdListToSelect.clear();
    getAllEmployeesByFarmIdToSelect(farm.value);
  }

  @action
  void updateEmployee(SelectEntity employee) {
    this.employee = employee;
  }

  @action
  Future<void> getAllPaymentMethodsToSelect() async {
    isPaymentMethodLoading = true;
    final getAllPaymentMethodsToSelect = Modular.get<GetAllPaymentMethodsToSelectUsecase>();
    final result = await getAllPaymentMethodsToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      paymentMethodListToSelect = ObservableList<SelectEntity>.of(success.data!);
      return success;
    });
    isPaymentMethodLoading = false;
  }

  @action
  void updatePaymentMethod(SelectEntity selectedMethod) {
    paymentMethod = selectedMethod;
  }

  @action
  void toggleIsUrgent(bool? newValue) {
    if (newValue != null) {
      isUrgent = newValue;
    }
  }

  @action
  void resetState() {
    isFirstLoading = false;
    isCostCenterLoading = false;
    isFarmLoading = false;
    isEmployeeLoading = false;
    isPaymentMethodLoading = false;

    purchaseRequestTypeListToSelect.clear();
    costCenterListToSelect.clear();
    farmsByCostCenterIdListToSelect.clear();
    employeeByFarmIdListToSelect.clear();
    paymentMethodListToSelect.clear();
    deliveryLocationListToSelect.clear();

    employee = null;
    purchaseRequestType = null;
    costCenter = null;
    farm = null;
    paymentMethod = null;
    deliveryLocationId = null;

    isUrgent = false;

    initializeDates();

    finalRequestedProducts.clear();
    finalRequestedCompanies.clear();
    finalRequestedAgriculturalInputs.clear();
  }

  @action
  Future<void> getAllPurchaseRequestTypeToSelect() async {
    isFirstLoading = true;

    final getAllPurchaseRequestTypesToSelect = Modular.get<GetAllPurchaseRequestTypesToSelectUsecase>();
    final result = await getAllPurchaseRequestTypesToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequestTypeListToSelect = success.data!;
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllCostCenterToSelect() async {
    isFirstLoading = true;

    final getAllCostCenterToSelect = Modular.get<GetAllCostCentersToSelectUsecase>();
    final result = await getAllCostCenterToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      costCenterListToSelect = success.data!;
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllCostCentersByCostCenterTypeIdToSelect() async {
    isCostCenterLoading = true;
    final getAllCostCentersByCostCenterTypeIdToSelect = Modular.get<GetAllCostCentersByCostCenterTypeIdToSelectUsecase>();
    final result = await getAllCostCentersByCostCenterTypeIdToSelect(ArgParams(firstArgs: 1));
    result.fold((error) => error.friendlyMessage, (success) {
      costCenterByCostCenterTypeIdListToSelect = success.data!;
      return success;
    });
    isCostCenterLoading = false;
  }

  @action
  Future<void> getAllDeliveryLocationsToSelect() async {
    isFirstLoading = true;

    final getAllDeliveryLocationsToSelect = Modular.get<GetAllPurchaseRequestDeliveryLocationsToSelectUsecase>();
    final result = await getAllDeliveryLocationsToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      deliveryLocationListToSelect = ObservableList<SelectEntity>.of(success.data!);
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllFarmsByCostCenterIdToSelect(int costCenterId) async {
    isFarmLoading = true;

    final getAllFarmsByCostCenterIdToSelect = Modular.get<GetAllFarmsByCostCenterIdToSelectUsecase>();
    final result = await getAllFarmsByCostCenterIdToSelect(ArgParams(firstArgs: costCenterId));

    result.fold((error) => error.friendlyMessage, (success) {
      farmsByCostCenterIdListToSelect = success.data!;
      return success;
    });
    isFarmLoading = false;
  }

  @action
  Future<void> getAllEmployeesByFarmIdToSelect(int farmId) async {
    isEmployeeLoading = true;

    final getAllEmployeesByFarmIdToSelect = Modular.get<GetAllEmployeesByFarmIdToSelectUsecase>();
    final result = await getAllEmployeesByFarmIdToSelect(ArgParams(firstArgs: farmId));

    result.fold((error) => error.friendlyMessage, (success) {
      employeeByFarmIdListToSelect = success.data!;
      return success;
    });
    isEmployeeLoading = false;
  }

  @action
  Future<Either<ApplicationError, dynamic>> createPurchaseRequest(BuildContext context) async {
    isPaymentMethodLoading = true;

    List<ItemsEntity> allRequestedItems = [];
    if (purchaseRequestType?.value == 1) {
      allRequestedItems.addAll(finalRequestedProducts);
    } else if (purchaseRequestType?.value == 2) {
      allRequestedItems.addAll(finalRequestedAgriculturalInputs);
    }

    final argParams = ArgParams(
        firstArgs: SendPurchaseRequestEntity(
          quotationExpirationDate: DateTimeFormatter.convertDdMmYyyySlashToIso8601(quotationExpirationDate),
          paymentDate: DateTimeFormatter.convertDdMmYyyySlashToIso8601(paymentDate),
          deliveryLocationId: deliveryLocationId?.value,
          isUrgent: isUrgent,
          typeId: purchaseRequestType?.value,
          farmId: farm?.value,
          costCenterId: costCenter?.value,
          responsibleEmployeeId: employee?.value,
          paymentMethodId: paymentMethod?.value,
          companyIds: finalRequestedCompanies.map((company) => company.value).toList(),
          items: allRequestedItems.map((item) {
            if (purchaseRequestType?.value == 1) {
              return ItemsEntity(
                productId: item.productId,
                requestedQuantity: item.requestedQuantity,
              );
            } else if (purchaseRequestType?.value == 2) {
              return ItemsEntity(
                agriculturalInputId: item.agriculturalInputId,
                requestedQuantity: item.requestedQuantity,
              );
            }
            return ItemsEntity(requestedQuantity: item.requestedQuantity);
          }).toList(),
        )
    );
    final createPurchaseRequest = Modular.get<CreatePurchaseRequestUsecase>();
    final result = await createPurchaseRequest(argParams);

    isPaymentMethodLoading = false;
    return result.fold((error) {
      debugPrint('Erro ao criar cotação de compra: ${error.friendlyMessage}');
      CustomSnackBarWidget.show(
        SnackBarType.error,
        context,
        'Erro ao criar cotação de compra. \n ${error.friendlyMessage}',
      );
      return Left(error);
    },
            (success) {
          debugPrint('Cotação de compra criada com sucesso!');
          CustomSnackBarWidget.show(
            SnackBarType.success,
            context,
            'Cotação de compra criada com sucesso!',
          );
          return Right(success);
        });
  }
}









