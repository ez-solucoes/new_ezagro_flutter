import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/crop_entities/crop_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machine_implement_entities/machine_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/employee_usecase/employee_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/executor_usecases/executor_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/farm_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/machinery_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/create_service_order_usecase.dart';
import '../../../../../../consts/app_strings.dart';
import '../../../../../../core/local_storage/local_storage_client_secure_impl.dart';
import '../../../../../../core/local_storage/local_storage_item.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../data/models/agricultural_models/agricultural_activity_model.dart';
part 'create_service_order_controller.g.dart';

class CreateServiceOrderController = _CreateServiceOrderController with _$CreateServiceOrderController;

abstract class _CreateServiceOrderController with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isLastPage = false;

  @observable
  int page = 0;

  @observable
  bool selectAll = false;

  @observable
  List<AgriculturalActivityEntity> activityOptions = ObservableList();

  @observable
  List<CostCenterEntity> costCenterOptions = ObservableList();

  @observable
  List<FarmEntity> farmOptions = ObservableList();

  @observable
  List<CropEntity> cropOptions = ObservableList();

  @observable
  List<EmployeeEntity> executorsOptions = ObservableList();

  @observable
  List<MachineImplementEntity> machineryOptions = ObservableList();

  @observable
  List<ProductEntity> productsOptions = ObservableList();

  @observable
  List<EmployeeEntity> employeeOptions = ObservableList();

  @observable
  List<PlotEntity> plotsOptions = ObservableList();

  @observable
  List<int> selectedPlots = ObservableList();

  @observable
  List<String> selectedMachinery = ObservableList();

  @observable
  List<String> selectedProducts = ObservableList();

  @observable
  List<String> selectedExecutors = ObservableList();

  @observable
  AgriculturalActivityEntity? activity;

  Map<String, dynamic>  harvest = {"harvest": null};

  String startDate = "";

  String? endDate;

  String farmId = "";

  Map<String, dynamic> plotsIds = {"plots": []};

  int totalArea = 0;

  String cropDiversityId = "";

  Map<String, dynamic> machineryIds = {"machineImplements": []};

  String inventoryId = "";

  Map<String, dynamic> productsId = {"productRecommendations": []};

  int? costCenterId;

  Map<String, dynamic> activityHolder = {"employeeActivityHolder": null};

  Map<String, dynamic> executorsIds = {"companies": []};

  Map<String, dynamic> responsible = {"employees": []};

  double activityValue = 0;

  String notes = "";

  //Select Plots Page Variables
  final ScrollController scrollController = ScrollController();
  final double itemHeight = 70;

  @observable
  bool isSelecting = false;

  @observable
  int startIndex = 0;

  Future<void> _writeToken() async {
    final storage = Modular.get<LocalStorageClientSecureImpl>();
    String? token = await storage.readData(AppStrings.tokenKey);
    if (token != null) {
      await storage.deleteData(AppStrings.tokenKey);
    }
    await storage.writeData(LocalStorageItem(key: AppStrings.tokenKey, value: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMTExMTExMTExMSIsImV4cCI6MTcyODQxMTMzNSwiaWF0IjoxNzI4MzI0OTM1fQ.SwhAFopJkI48j6rr95b7Z4OmgKrnUBkxqh-baYLQeyoTBxx99rJ20zFtzHZ6rI7vGTfzuewYoQmqvLTIt2vGpg'));
  }

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
    await _writeToken();
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
  Future getEmployeeOptions() async {
    isLoading = true;
    final getEmployees = Modular.get<EmployeeUsecase>();
    final result = await getEmployees(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      employeeOptions = success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future createServiceOrder() async {
    isLoading = true;
    const mock = MockParams();
    final createServiceOrder = Modular.get<CreateServiceOrderUsecase>();
    final result = await createServiceOrder(mock);
    result.fold((error) => error.friendlyMessage, (success) {
      return success;
    });

    isLoading = false;
  }

  finishOSCreation() {
    if (_validFields()) {
    Map<String, dynamic> osPayload = {
    "activityStart": "",
    "activityEnd": "",
    "farm": {
    "farmId": farmId
    },
    "plots": plotsIds["plots"],
    "areaTotal": totalArea,
    "cropDiversity": {
    "cropDiversityId" : cropDiversityId
    },
    "machineImplements": machineryIds["machineryImplements"],
    "inventorySource": {
    "inventoryId": inventoryId
    },
    "productRecommendations": productsId["productRecommendations"],
    "agriculturalActivity": AgriculturalActivityModel.fromEntity(activity!).toMap(),
    "costCenterLocal": {
    "costCenterId": costCenterId
    },
    "employeeActivityHolder": activityHolder["employeeActivityHolder"],
    "employees": responsible["employees"],
    "description": notes,
    "activityValue": activityValue,
    "expectedStartDate": startDate,
    "expectedEndDate": endDate,
    };
    createServiceOrder();
    }
  }


  @action
  toggleSelectAll() {
    if(plotsOptions.length != selectedPlots.length) {
      for (int i = 0; i < plotsOptions.length; i++) {
          selectedPlots.add(plotsOptions[i].id);
      }
    } else {
      selectedPlots = [];
    }
  }

  @action
   incrementPage() {
    if (page<=6) {
      page+=1;
    }
    isLastPage = page == 6;
  }

  @action
  decrementPage() {
    if (page>0) {
      page-=1;
    }
    isLastPage = page == 6;
  }

  bool _validFields() {
    if (activity == null) {
      return false;
    }
    if (costCenterId == null){
      return false;
    }
    return true;
  }

  //Select Plots Actions
  @action
  void onLongPressEnd(LongPressEndDetails details) {
      isSelecting = false;
  }
  void autoScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 30) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    } else if (scrollController.position.pixels <= 30) {
      scrollController.jumpTo(0);
    }
  }

  void onLongPressStart(LongPressStartDetails details) {
    final offset = scrollController.offset;
    final itemIndex = ((details.localPosition.dy + offset) / itemHeight).floor();
    startIndex = itemIndex;

    final start = itemIndex.clamp(0, plotsOptions.length - 1);

    if (!selectedPlots.contains(plotsOptions[start])) {
      selectedPlots.add(plotsOptions[start].id);
    }
    isSelecting = true;
  }

  @action
  void onLongPressUpdate(LongPressMoveUpdateDetails details) {
    if (isSelecting) {
      final itemIndex =
          (scrollController.offset / itemHeight)
              .floor() +
              (details.localPosition.dy / itemHeight)
                  .floor();
      if (itemIndex >= 0 && itemIndex < plotsOptions.length) {
          int start = startIndex;
          int end = itemIndex;

          if (end > start) {
            for (int i = start; i < end; i++) {
              if (!selectedPlots.contains(plotsOptions[i].id)) {
                selectedPlots.add(plotsOptions[i].id);
              }
            }
            final deltaScroll = scrollController.offset == 0 ? 130 : 30;
            scrollController.jumpTo(
                scrollController.position.pixels + deltaScroll);
            autoScroll();
          }
      }
    }
  }

}
