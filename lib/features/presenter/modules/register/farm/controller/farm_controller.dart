import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/farm_entities/farm_entity.dart';
import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../../domain/usecases/farm_usecases/get_all_farms_usecases/get_all_farms_usecase.dart';
import '../../../../../domain/usecases/farm_usecases/get_farm_by_id_usecases/get_farm_by_id_usecase.dart';
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
    final getFarms = Modular.get<GetAllFarmsUsecase>();
    final result = await getFarms(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      farms = success.data!;
      filteredFarms = farms;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getFarmById(ArgParams args) async {
    isLoading = true;
    final getFarm = Modular.get<GetFarmByIdUsecase>();
    final result = await getFarm(args);
    result.fold((error) => error.friendlyMessage, (success) {
      farm = success.data!;
      return success;
    });

    isLoading = false;
  }

  @action
  void searchFarm(String searchText) {
    filteredFarms = farms.where((e) =>
    (e.name?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.ownerName?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
