import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/params/create_service_order_params/create_service_order_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/employee_usecase/employee_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/executor_usecases/executor_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/cost_center_farm_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/machinery_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/pest_usecases/pest_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_with_farm_id_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/create_service_order_usecase.dart';
import '../../../../../../core/enums/field_service_order_type_enum.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/pest_entities/pest_entity.dart';
part 'create_service_order_controller.g.dart';

class CreateServiceOrderController = CreateServiceOrderControllerAbstract with _$CreateServiceOrderController;

abstract class CreateServiceOrderControllerAbstract with Store {
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
  List<PestEntity> pestsOptions = ObservableList();

  @observable
  List<SelectorEntity> costCenterOptions = ObservableList();

  @observable
  List<FarmEntity> farmOptions = ObservableList();

  @observable
  List<SelectorEntity> cropOptions = ObservableList();

  @observable
  List<SelectorEntity> executorsOptions = ObservableList();

  @observable
  List<SelectorEntity> machineryOptions = ObservableList();

  @observable
  List<SelectorEntity> productsOptions = ObservableList();

  @observable
  List<SelectorEntity> employeeOptions = ObservableList();

  @observable
  List<PlotEntity> plotsOptions = ObservableList();

  @observable
  List<int> selectedPlots = ObservableList();

  @observable
  List<int> selectedMachinery = ObservableList();

  @observable
  List<int> selectedProducts = ObservableList();

  @observable
  List<int> selectedExecutors = ObservableList();

  @observable
  List<PestEntity> selectedPests = ObservableList();

  @observable
  AgriculturalActivityEntity? activity;

  @observable
  String harvestName = "";

  Map<String, dynamic>  harvest = {"harvest": null};

  String startDate = "";

  String? endDate;

  int farmId = 0;

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
  int getPageNumber() {
    switch (getFieldServiceOrderTypeEnum(activity?.activityType ?? "")) {
      case FieldServiceOrderTypeEnum.transfer:
        return 6;
      case FieldServiceOrderTypeEnum.monitoring:
        return 8;
      default:
        return 7;
    }
  }

  @action
  Future getCostCenters() async {
    isLoading = true;
    final getCostCenters = Modular.get<CostCenterUsecase>();
    final result = await getCostCenters(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      costCenterOptions = success.content.map((e) {
        return SelectorEntity(id: e.id, name: e.costCenterName);
      }).toList();
      return success;
    });

    isLoading = false;
  }

  @action
  Future getCostCenterFarms(String costCenterId) async {
    isLoading = true;
    final getCostCenterFarms = Modular.get<CostCenterFarmUsecase>();
    final result = await getCostCenterFarms(costCenterId);
    result.fold((error) => error.friendlyMessage, (success) {
      farmOptions = success;
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
      //cropOptions= success.content;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getPlotsOptions() async {
    isLoading = true;
    final getPlots = Modular.get<PlotsWithFarmIdUsecase>();
    if (farmId != 0 ) {
      final result = await getPlots(ArgParams(firstArgs: farmId.toString()));
      result.fold((error) => error.friendlyMessage, (success) {
        plotsOptions = success.content;
        return success;
      });
    }

    isLoading = false;
  }

  @action
  Future getPests() async {
    isLoading = true;
    final getPests = Modular.get<PestUsecase>();
    final result = await getPests(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      pestsOptions = success.content;
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
      //executorsOptions = success.content;
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
     // machineryOptions = success.content;
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
      //productsOptions = success.content;
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
     // employeeOptions = success.content;
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

    if (!selectedPlots.contains(plotsOptions[start].id)) {
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
