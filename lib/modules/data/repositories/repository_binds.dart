import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/data/repositories/service_order_list_repositories/service_order_list_repository_impl.dart';

import '../../../features/domain/repositories/service_order_list_repositories/service_order_list_repository.dart';

class RepositoryBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ServiceOrderListRepository>(
        ServiceOrderListRepositoryImpl.new);
    super.exportedBinds(i);
  }
}

// @override
// void exportedBinds(i) {
//
//   ///Service Order List
//   i.addLazySingleton<ServiceOrderListRepository>(ServiceOrderListRepositoryImpl.new);
// }
