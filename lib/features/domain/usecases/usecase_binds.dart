import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/service_order_list_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_usecase/service_order_list_usecase_impl.dart';


class UsecaseBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ServiceOrderListUsecase>(
        ServiceOrderListUsecaseImpl.new);
    super.exportedBinds(i);
  }
}

//   @override
//   void exportedBinds(i) {
//
//   }
// }
