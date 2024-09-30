import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
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
import '../../../../core/usecase/usecase.dart';
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
  List<MockEntity> employeeOptions = ObservableList();

  @observable
  List<MockEntity> plotsOptions = ObservableList();

  @observable
  List<String> selectedPlots = ObservableList();

  @observable
  List<String> selectedMachinery = ObservableList();

  @observable
  List<String> selectedProducts = ObservableList();

  @observable
  List<String> selectedExecutors = ObservableList();

  Map<String, dynamic> activity = {"activity": null};

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

  String costCenterId = "";

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

  final mockPlots = List.generate(300, (index) {
    return [(index).toString(), '100ha', 'milho'];
  });

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
    "agriculturalActivity": activity["activity"],
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
    if(mockPlots.length != selectedPlots.length) {
      for (int i = 0; i < mockPlots.length; i++) {
          selectedPlots.add(mockPlots[i][0]);
      }
    } else {
      selectedPlots.clear();
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

    final start = itemIndex.clamp(0, mockPlots.length - 1);

    if (!selectedPlots.contains(mockPlots[start][0])) {
      selectedPlots.add(mockPlots[start][0]);
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
      if (itemIndex >= 0 && itemIndex < mockPlots.length && startIndex != null) {
          int start = (startIndex!);
          int end = itemIndex;

          if (end > start) {
            for (int i = start; i < end; i++) {
              if (!selectedPlots.contains(mockPlots[i][0])) {
                selectedPlots.add(mockPlots[i][0]);
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
