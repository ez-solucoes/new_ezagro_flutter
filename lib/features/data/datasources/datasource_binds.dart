import 'package:flutter_modular/flutter_modular.dart';
import '../../../features/data/datasources/service_order_datasources/service_order_datasource.dart';
import '../../../features/data/datasources/service_order_datasources/service_order_datasource_impl.dart';


class DatasourceBinds extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ServiceOrderDatasource>(
        ServiceOrderDatasourceImpl.new);
    super.exportedBinds(i);
  }
}

// @override
// void exportedBinds(i) {
//
//   ///Service Order List
//   i.addLazySingleton<ServiceOrderListDatasource>(ServiceOrderListDatasourceImpl.new);
//
// }
