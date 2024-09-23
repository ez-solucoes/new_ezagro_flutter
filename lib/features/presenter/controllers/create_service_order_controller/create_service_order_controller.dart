import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/executor_usecases/executor_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/machinery_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecase.dart';
import '../../../../core/usecase/usecase.dart';
part 'create_service_order_controller.g.dart';

class CreateServiceOrderController = _CreateServiceOrderController with _$CreateServiceOrderController;

abstract class _CreateServiceOrderController with Store {
  @observable
  bool isLoading = false;

  @observable
  int page = 0;

  @observable
  bool selectAll = false;

  @observable
  List<MockEntity> activityOptions = ObservableList();

  @observable
  List<MockEntity> costCenterOptions = ObservableList();

  @observable
  List<MockEntity> farmOptions = ObservableList();

  @observable
  List<MockEntity> cropOptions = ObservableList();

  @observable
  List<MockEntity> executorsOptions = ObservableList();

  @observable
  List<MockEntity> machineryOptions = ObservableList();

  @observable
  List<MockEntity> productsOptions = ObservableList();

  @observable
  List<MockEntity> plotsOptions = ObservableList();

  @observable
  List<String> plots = ObservableList();

  @observable
  List<String> machinery = ObservableList();

  @observable
  List<String> products = ObservableList();

  @observable
  List<String> executors = ObservableList();

  Map<String, dynamic> activity = {"activity": null};

  Map<String, dynamic>  costCenter = {"costCenter": null};

  Map<String, dynamic>  farm = {"farm": null};

  Map<String, dynamic>  harvest = {"harvest": null};

  Map<String, dynamic> selectedPlots = {"plots": null};

  Map<String, dynamic> selectedExecutors = {"executioners": null};

  Map<String, dynamic> selectedMachinery = {"machinery": null};

  Map<String, dynamic> selectedProducts = {"products": null};

  Map<String, dynamic> startDate = {"startDate": null};

  Map<String, dynamic> endDate = {"endDate": null};

  Map<String, dynamic> responsible = {"responsible": null};

  Map<String, dynamic> finalCostCenter = {"finalCostCenter": null};

  Map<String, dynamic> finalStorage = {"finalStorage": null};

  Map<String, dynamic> servicePrice = {"servicePrice": null};

  Map<String, dynamic> notes = {"notes": null};

  @action
  Future getActivities() async {
    isLoading = true;
    final getActivities = Modular.get<ActivityUsecase>();
    final result = await getActivities(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      activityOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getCostCenters() async {
    isLoading = true;
    final getCostCenters = Modular.get<CostCenterUsecase>();
    final result = await getCostCenters(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      costCenterOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getSimplifiedFarms() async {
    isLoading = true;
    final getSimplifiedFarms = Modular.get<FarmUsecase>();
    final result = await getSimplifiedFarms(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      farmOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getSimplifiedCrops() async {
    isLoading = true;
    final getSimplifiedCrops = Modular.get<CropUsecase>();
    final result = await getSimplifiedCrops(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      cropOptions= success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getPlotsOptions() async {
    isLoading = true;
    final getPlots = Modular.get<PlotsUsecase>();
    final result = await getPlots(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      plotsOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getExecutorOptions() async {
    isLoading = true;
    final getExecutors = Modular.get<ExecutorUsecase>();
    final result = await getExecutors(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      executorsOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getMachinery() async {
    isLoading = true;
    final getMachinery = Modular.get<MachineryUsecase>();
    final result = await getMachinery(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      machineryOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getProductsOptions() async {
    isLoading = true;
    final getProducts = Modular.get<ProductUsecase>();
    final result = await getProducts(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      productsOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  toggleSelectAll() {
    selectAll = !selectAll;
  }

  @action
   incrementPage() {
    if (page<=6) {
      page+=1;
    }
  }

  @action
  decrementPage() {
    if (page>0) {
      page-=1;
    }
  }

}
