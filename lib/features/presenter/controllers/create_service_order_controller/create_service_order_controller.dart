import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/activity_usecase/activity_usecase.dart';
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
  List<String> executioners = ObservableList();

  @observable
  List<String> machinery = ObservableList();

  @observable
  List<String> products = ObservableList();

  List<String> plots = ObservableList();

  Map<String, dynamic> activity = {"activity": null};

  Map<String, dynamic>  costCenter = {"costCenter": null};

  Map<String, dynamic>  farm = {"farm": null};

  Map<String, dynamic>  harvest = {"harvest": null};

  Map<String, dynamic> selectedPlots = {"plots": null};

  Map<String, dynamic> selectedExecutioners = {"executioners": null};

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