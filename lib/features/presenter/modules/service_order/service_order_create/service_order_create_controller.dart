import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_activity_usecases/agricultural_activity_type_usecases/get_all_agricultural_activity_types_to_select_usecases/get_all_agricultural_activity_types_to_select_usecase.dart';

import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_to_select_usecases/get_all_agricultural_activities_to_select_usecase.dart';
import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_usecases/get_all_agricultural_activities_usecase.dart';


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

  //Select Lists
  @observable
  List<SelectEntity> agriculturalActivityListToSelect = ObservableList();
  @observable
  List<SelectEntity> agriculturalActivityTypeListToSelect = ObservableList();

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

  @action
  void getAllAgriculturalActivityTypesToSelect() async {
    isFirstLoading = true;

    final getAllAgriculturalActivityTypesToSelect = Modular.get<GetAllAgriculturalActivityTypesToSelectUsecase>();
    final result = await getAllAgriculturalActivityTypesToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityTypeListToSelect = success;
    });
    isFirstLoading = false;
  }

  @action
  void getAllAgriculturalActivitiesToSelect() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivitiesToSelect = Modular.get<GetAllAgriculturalActivitiesToSelectUsecase>();
    final result = await getAllAgriculturalActivitiesToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityListToSelect = success;

    });
    isAgriculturalActivityLoading = false;
  }

  @action
  void getAllAgriculturalActivities() async {
    isAgriculturalActivityLoading = true;
    final getAllAgriculturalActivities = Modular.get<GetAllAgriculturalActivitiesUsecase>();
    final result = await getAllAgriculturalActivities(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalActivityList = ObservableList.of(success);

    });
    isAgriculturalActivityLoading = false;
  }

}