import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/farm_plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/stock_entities/stock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/get_all_cost_centers_to_select_usecases/get_all_cost_centers_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_variety_usecases/get_all_crop_varieties_by_crop_id_to_select_usecases/get_all_crop_varieties_by_crop_id_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_variety_usecases/get_crop_variety_by_id_usecases/get_crop_variety_by_id_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_plot_usecases/get_all_farm_plots_to_select_usecases/get_all_farm_plots_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_plot_usecases/get_all_farm_plots_usecases/get_all_farm_plots_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import '../../../../domain/entities/response_entities/response_entity.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/agricultural_activity_type_usecases/get_all_agricultural_activity_types_to_select_usecases/get_all_agricultural_activity_types_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/agricultural_sub_activitiy_usecases/get_all_agricultural_sub_activities_by_activity_id_to_select_usecases/get_all_agricultural_sub_activities_by_activity_id_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_to_select_usecases/get_all_agricultural_activities_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_usecases/get_all_agricultural_activities_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activity_by_type_id_to_select_usecases/get_all_agricultural_activity_by_type_id_to_select_usecase.dart';
import '../../../../domain/usecases/cost_center_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecase.dart';
import '../../../../domain/usecases/crop_usecases/get_all_crops_to_select_usecases/get_all_crops_to_select_usecase.dart';
import '../../../../domain/usecases/farm_usecases/get_all_farms_by_cost_center_id_to_select_usecases/get_all_farms_by_cost_center_id_to_select_usecase.dart';
import '../../../../domain/usecases/stock_usecases/get_all_stocks_to_select_usecases/get_all_stocks_to_select_usecase.dart';
import '../../../../domain/usecases/stock_usecases/get_all_stocks_usecases/get_all_stocks_usecase.dart';
import '../../../../domain/usecases/stock_usecases/get_stock_by_id_usecases/get_stock_by_id_usecase.dart';

part 'service_order_create_controller.g.dart';

class ServiceOrderCreateController = ServiceOrderCreateControllerAbstract with _$ServiceOrderCreateController;
abstract class ServiceOrderCreateControllerAbstract with Store {

  //loading controllers
  @observable
  bool isFirstLoading = false;
  @observable
  bool isAgriculturalActivityLoading = false;
  @observable
  bool isAgriculturalActivityTypeLoading = false;
  @observable
  bool isAgriculturalSubActivityLoading = false;
  @observable
  bool hasAgriculturalSubActivity = false;
  @observable
  bool isCostCenterLoading = false;
  @observable
  bool isFarmLoading = false;
  @observable
  bool isCropLoading = false;
  @observable
  bool isCropVarietyLoading = false;
  @observable
  bool isNewPlanting = false;
  @observable
  bool isTechnologyLoading = false;
  @observable
  bool isFarmPlotLoading = false;
  @observable
  bool isStockLoading = false;

  //Select Lists
  @observable
  List<SelectEntity> agriculturalActivityListToSelect = ObservableList();
  @observable
  List<SelectEntity> agriculturalSubActivityListToSelect = ObservableList();
  @observable
  List<SelectEntity> agriculturalActivityTypeListToSelect = ObservableList();
  @observable
  List<SelectEntity> costCenterListToSelect = ObservableList();
  @observable
  List<SelectEntity> costCenterByCostCenterTypeIdListToSelect = ObservableList();
  @observable
  List<SelectEntity> farmsByCostCenterIdListToSelect = ObservableList();
  @observable
  List<SelectEntity> cropListToSelect = ObservableList();
  @observable
  List<SelectEntity> cropVarietyListToSelect = ObservableList();
  @observable
  List<SelectEntity> farmPlotListToSelect = ObservableList();
  @observable
  List<SelectEntity> originListToSelect = ObservableList();
  @observable
  List<SelectEntity> destinationListToSelect = ObservableList();
  @observable
  List<SelectEntity> stockListToSelect = ObservableList();

  //Entities List
  @observable
  List<AgriculturalActivityEntity> agriculturalActivityList = ObservableList();
  @observable
  List<FarmPlotEntity> farmPlotList = ObservableList();

  //Selected items
  @observable
  SelectEntity? agriculturalActivity;
  @observable
  SelectEntity? agriculturalActivityType;
  @observable
  SelectEntity? agriculturalSubActivity;
  @observable
  SelectEntity? costCenter;

  @observable
  SelectEntity? costCenterByCostCenterTypeId;
  @observable
  SelectEntity? farm;
  @observable
  SelectEntity? crop;
  @observable
  SelectEntity? cropVariety;
  @observable
  String? technologyName;
  String? harvestOrder;
  @observable
  List<SelectEntity> selectedFarmPlotList = ObservableList();
  @observable
  int? originStockId;
  @observable
  int? destinationStockId;
  @observable
  List<StockEntity> stockList = ObservableList();
  @observable
  StockEntity? originStock;
  @observable
  StockEntity? destinationStock;

  @action
  void updateCostCenterAndReload(SelectEntity costCenter) {
    this.costCenter = costCenter;
    farm = null;
    farmsByCostCenterIdListToSelect.clear();
    getAllFarmsByCostCenterIdToSelect(costCenter.value);
  }

  @action
  Future<void> getAllAgriculturalActivityTypesToSelect() async {
    isFirstLoading = true;

    final getAllAgriculturalActivityTypesToSelect = Modular.get<GetAllAgriculturalActivityTypesToSelectUsecase>();
    final result = await getAllAgriculturalActivityTypesToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityTypeListToSelect = success.data!;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivitiesToSelect() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivitiesToSelect = Modular.get<GetAllAgriculturalActivitiesToSelectUsecase>();
    final result = await getAllAgriculturalActivitiesToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityListToSelect = success.data!;

    });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivities() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivities = Modular.get<GetAllAgriculturalActivitiesUsecase>();
    final result = await getAllAgriculturalActivities(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityList = ObservableList.of(success.data!);

    });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivityByTypeIdToSelect() async {
    isAgriculturalActivityLoading = true;

    final getAllAgriculturalActivityByTypeIdToSelect = Modular.get<GetAllAgriculturalActivitiesByTypeIdToSelectUsecase>();
    final result = await getAllAgriculturalActivityByTypeIdToSelect(ArgParams(firstArgs: agriculturalActivityType?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityListToSelect = ObservableList.of(success.data!);


  });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalSubActivitiesByActivityIdToSelect() async {
    isAgriculturalSubActivityLoading = true;

    final getAllAgriculturalSubActivitiesByActivityIdToSelect = Modular.get<GetAllAgriculturalSubActivitiesByActivityIdToSelectUsecase>();
    final result = await getAllAgriculturalSubActivitiesByActivityIdToSelect(ArgParams(firstArgs: agriculturalActivity?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalSubActivityListToSelect = ObservableList.of(success.data!);
      hasAgriculturalSubActivity = true;
    });
    isAgriculturalSubActivityLoading = false;

  }

  @action
  Future<void> getAllCostCenterToSelect() async {
    isCostCenterLoading = true;

    final getAllCostCenterToSelect = Modular.get<GetAllCostCentersToSelectUsecase>();
    final result = await getAllCostCenterToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      costCenterListToSelect = success.data!;
      return success;
    });
    isCostCenterLoading = false;
  }

  @action
  Future<void> getAllCostCentersByCostCenterTypeIdToSelect() async {
    isCostCenterLoading = true;
    final getAllCostCentersByCostCenterTypeIdToSelect = Modular.get<GetAllCostCentersByCostCenterTypeIdToSelectUsecase>();
    final result = await getAllCostCentersByCostCenterTypeIdToSelect(ArgParams(firstArgs: 2));
    result.fold((error) => error.friendlyMessage, (success) {
      costCenterByCostCenterTypeIdListToSelect = success.data!;
      return success;
    });
     isCostCenterLoading = false;
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
  Future<void> getAllCropsToSelect() async {
    isCropLoading = true;

    final getAllCropsToSelect = Modular.get<GetAllCropsToSelectUsecase>();
    final result = await getAllCropsToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      cropListToSelect = success.data!;

    });
    isCropLoading = false;
  }

  @action
  Future<void> getAllCropVarietiesByCropIdToSelect() async {
    isCropVarietyLoading = true;

    final getAllCropVarietiesByCropIdToSelect = Modular.get<GetAllCropVarietiesByCropIdToSelectUsecase>();
    final result = await getAllCropVarietiesByCropIdToSelect(ArgParams(firstArgs: crop?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      cropVarietyListToSelect = success.data!;

    });
    isCropVarietyLoading = false;
  }

  @action
  Future<void> getCropVarietyById() async {
    isTechnologyLoading = true;
    final getCropVarietyById = Modular.get<GetCropVarietyByIdUsecase>();
    final result = await getCropVarietyById(ArgParams(firstArgs: cropVariety?.value));
    result.fold((error) => error.friendlyMessage, (success) {

      if(success.data!.technologyName != null) {
        technologyName = success.data!.technologyName;
      }
    });
    isTechnologyLoading = false;
  }

  @action
  Future<void> getAllFarmPloToSelect() async {
    isFirstLoading = true;

    final getAllFarmPlotListToSelect = Modular.get<GetAllFarmPlotsToSelectUsecase>();
    final result = await getAllFarmPlotListToSelect(ArgParams(firstArgs: 15));
    result.fold((error) => error.friendlyMessage,  (success){
      farmPlotListToSelect = success.data!;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllFarmPlots() async {
    isFirstLoading = true;
    final getAllFarmPlots = Modular.get<GetAllFarmPlotsUsecase>();
    final result = await getAllFarmPlots(ArgParams(firstArgs: 15));
    result.fold((error) => error.friendlyMessage, (success){
      farmPlotList = success.data!;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllStocksToSelect() async {
    isFirstLoading = true;

    final getAllStocksToSelect = Modular.get<GetAllStocksToSelectUsecase>();
    final result = await getAllStocksToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      stockListToSelect = success.data!;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllStocks() async {
    isFirstLoading = true;
    final getAllStocks = Modular.get<GetAllStocksUsecase>();
    final result = await getAllStocks(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      stockList = success.data!;
    });
    isFirstLoading = false;
  }

  @action
  Future<Either<ApplicationError, ResponseEntity<StockEntity>>> getStockById(int stockId) async {
    isStockLoading = true;

    try{
      final getStockById = Modular.get<GetStockByIdUsecase>();
      final result = await getStockById(ArgParams(firstArgs: stockId));
      return result;
    } finally {
      isStockLoading = false;
    }

  }
}