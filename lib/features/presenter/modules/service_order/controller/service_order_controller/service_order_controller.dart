
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../domain/entities/service_order_entities/service_order_entity.dart';
import '../../../../../domain/usecases/service_order_usecase/get_service_order_by_id_usecase.dart';
part 'service_order_controller.g.dart';

class ServiceOrderController = ServiceOrderControllerAbstract with _$ServiceOrderController;

abstract class ServiceOrderControllerAbstract with Store {

  int serviceOrderId = 80548;

  @observable
  bool isLoading = true;

  @observable
  ServiceOrderEntity? serviceOrder;

  List<List<String>> informationList = [];

  @action
  Future getServiceOrder() async {
    isLoading = true;
    final getServiceOrder = Modular.get<GetServiceOrderByIdUsecase>();
    final result = await getServiceOrder(ArgParams(firstArgs: serviceOrderId));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrder = success as ServiceOrderEntity?;
      _buildDataLists();
      return success;
    });

    isLoading = false;
  }

  _buildDataLists() {
      informationList = [
        // ["Fazenda: ", serviceOrder?.farm?.farmName ?? ""],
        // ["Safra: ", serviceOrder?.cropDiversity?.crop?.name ?? ""],
        // ["Centro de Custo Local: ", serviceOrder?.costCenter?.costCenterName ?? ""],
        // ["Talhões:", _buildPlotStringPreview(serviceOrder?.plots?.map((e) => e.groupName).toList() ?? [])],
        // ["Área total: ", serviceOrder?.areaTotal?.toString() ?? ""]
      ];
  }

  String getNewPlantingString () {
    return (serviceOrder?.newPlanting ?? false) ? AppStringsPortuguese.newPlanting : "";
  }

  // String _buildPlotStringPreview(List<String?> plots) {
  //   String plot = plots
  //       .where((plot) => plot != null)
  //       .cast<String>().join(', '); // Join the remaining elements
  //   return plot == "" ? "Sem talhões cadastrados" : plot;
  // }
}