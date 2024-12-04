import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/get_farm_list_usecase/get_farm_list_usecase.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/farm_entities/farm_entity.dart';
part 'farm_controller.g.dart';

class FarmController = FarmControllerAbstract with _$FarmController;

abstract class FarmControllerAbstract with Store {


  @observable
  bool isLoading = false;

  @observable
  List<FarmEntity> farms = ObservableList();

  @observable
  List<FarmEntity> filteredFarms = ObservableList();

  @observable
  FarmEntity? farm;

  @action
  Future getFarmsList() async {
    isLoading = true;
    final getFarms = Modular.get<GetFarmListUsecase>();
    final result = await getFarms(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      farms = success;
      filteredFarms = farms;
      return success;
    });

    isLoading = false;
  }

  @action
  searchFarm(String searchText) {
    filteredFarms = farms.where((e) =>
    (e.name?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.ownerName?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
