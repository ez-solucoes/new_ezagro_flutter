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

}
