import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../domain/usecases/agricultural_activity_usecases/get_all_agricultural_activities_usecase.dart';


part 'service_order_create_controller.g.dart';

class ServiceOrderCreateController = ServiceOrderCreateControllerAbstract with _$ServiceOrderCreateController;
abstract class ServiceOrderCreateControllerAbstract with Store {

  @observable
  bool isFirstLoading = false;

  @observable
  List<SelectEntity> activityListToSelect = ObservableList();

  @action
  void getAllAgriculturalActivityTypesToSelect() async {
    isFirstLoading = true;

    final getAllAgriculturalActivityTypesToSelect = Modular.get<GetAllAgriculturalActivitiesUsecase>();
    final result = await getAllAgriculturalActivityTypesToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {

    });
  }
}