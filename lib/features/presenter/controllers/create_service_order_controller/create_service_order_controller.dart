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
