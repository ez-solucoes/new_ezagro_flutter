import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_variety_usecases/get_all_crop_varieties_by_crop_id_to_select_usecases/get_all_crop_varieties_by_crop_id_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_variety_usecases/get_crop_variety_by_id_usecases/get_crop_variety_by_id_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/agricultural_activity_type_usecases/get_all_agricultural_activity_types_to_select_usecases/get_all_agricultural_activity_types_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/agricultural_sub_activitiy_usecases/get_all_Agricultural_sub_activities_by_activity_id_to_select_usecases/get_all_agricultural_sub_activities_by_activity_id_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_to_select_usecases/get_all_agricultural_activities_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_usecases/get_all_agricultural_activities_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activity_by_type_id_to_select_usecases/get_all_agricultural_activity_by_type_id_to_select_usecase.dart';
import '../../../../domain/usecases/cost_center_usecases/get_all_cost_center_to_select_usecase.dart';
import '../../../../domain/usecases/crop_usecases/get_all_crops_to_select_usecases/get_all_crops_to_select_usecase.dart';
import '../../../../domain/usecases/farm_usecases/get_all_farms_by_cost_center_id_to_select_usecases/get_all_farms_by_cost_center_id_to_select_usecase.dart';

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
  List<SelectEntity> farmsByCostCenterIdListToSelect = ObservableList();
  @observable
  List<SelectEntity> cropListToSelect = ObservableList();
  @observable
  List<SelectEntity> cropVarietyListToSelect = ObservableList();

  //Entities List
  @observable
  List<AgriculturalActivityEntity> agriculturalActivityList = ObservableList();

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
  SelectEntity? farm;
  @observable
  SelectEntity? crop;
  @observable
  SelectEntity? cropVariety;
  @observable
  String? technologyName;

  String? harvestOrder;

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
      agriculturalActivityTypeListToSelect = success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivitiesToSelect() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivitiesToSelect = Modular.get<GetAllAgriculturalActivitiesToSelectUsecase>();
    final result = await getAllAgriculturalActivitiesToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityListToSelect = success;

    });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivities() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivities = Modular.get<GetAllAgriculturalActivitiesUsecase>();
    final result = await getAllAgriculturalActivities(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityList = ObservableList.of(success);

    });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalActivityByTypeIdToSelect() async {
    isAgriculturalActivityLoading = true;

    final getAllAgriculturalActivityByTypeIdToSelect = Modular.get<GetAllAgriculturalActivityByTypeIdToSelectUsecase>();
    final result = await getAllAgriculturalActivityByTypeIdToSelect(ArgParams(firstArgs: agriculturalActivityType?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityListToSelect = ObservableList.of(success);


  });
    isAgriculturalActivityLoading = false;
  }

  @action
  Future<void> getAllAgriculturalSubActivitiesByActivityIdToSelect() async {
    isAgriculturalSubActivityLoading = true;

    final getAllAgriculturalSubActivitiesByActivityIdToSelect = Modular.get<GetAllAgriculturalSubActivitiesByActivityIdToSelectUsecase>();
    final result = await getAllAgriculturalSubActivitiesByActivityIdToSelect(ArgParams(firstArgs: agriculturalActivity?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalSubActivityListToSelect = ObservableList.of(success);
      hasAgriculturalSubActivity = true;
    });
    isAgriculturalSubActivityLoading = false;

  }

  @action
  Future<void> getAllCostCenterToSelect() async {
    isCostCenterLoading = true;

    final getAllCostCenterToSelect = Modular.get<GetAllCostCenterToSelectUsecase>();
    final result = await getAllCostCenterToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      costCenterListToSelect = success;
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
      farmsByCostCenterIdListToSelect = success;
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
      cropListToSelect = success;

    });
    isCropLoading = false;
  }

  @action
  Future<void> getAllCropVarietiesByCropIdToSelect() async {
    isCropVarietyLoading = true;

    final getAllCropVarietiesByCropIdToSelect = Modular.get<GetAllCropVarietiesByCropIdToSelectUsecase>();
    final result = await getAllCropVarietiesByCropIdToSelect(ArgParams(firstArgs: crop?.value));
    result.fold((error) => error.friendlyMessage, (success) {
      cropVarietyListToSelect = success;

    });
    isCropVarietyLoading = false;
  }

  @action
  Future<void> getCropVarietyById() async {
    isTechnologyLoading = true;
    final getCropVarietyById = Modular.get<GetCropVarietyByIdUsecase>();
    final result = await getCropVarietyById(ArgParams(firstArgs: cropVariety?.value));
    result.fold((error) => error.friendlyMessage, (success) {

      if(success.technologyName != null) {
        technologyName = success.technologyName;
      }
    });
    isTechnologyLoading = false;
  }

}