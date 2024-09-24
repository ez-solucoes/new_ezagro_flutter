import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/repositories/service_order_repositories/service_order_repository_impl.dart';
import '../../../features/domain/repositories/service_order_repositories/service_order_repository.dart';

class RepositoryBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ServiceOrderRepository>(
        ServiceOrderRepositoryImpl.new);
    super.exportedBinds(i);
  }
}

// @override
// void exportedBinds(i) {
//
//   ///Service Order List
//   i.addLazySingleton<ServiceOrderListRepository>(ServiceOrderListRepositoryImpl.new);
// }
