import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/service_order_list_usecase_impl.dart';
import '../../../features/domain/usecases/service_order_list_usecase/service_order_list_usecase.dart';

class UsecaseBinds extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ServiceOrderListUsecase>(ServiceOrderListUsecaseImpl.new);
  }
}