import 'package:mobx/mobx.dart';
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
