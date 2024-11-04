
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/field_service_order_entities/field_service_order_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/service_order_list_usecase/get_service_order_by_id_usecase.dart';

import '../../../../../../design_system/strings/app_strings_portuguese.dart';
part 'service_order_controller.g.dart';

class ServiceOrderController = ServiceOrderControllerAbstract with _$ServiceOrderController;

abstract class ServiceOrderControllerAbstract with Store {

  int serviceOrderId = 0;

  @observable
  bool isLoading = true;

  @observable
  FieldServiceOrderEntity? serviceOrder;

  List<List<String>> informationList = [];

  @action
  Future getServiceOrder() async {
    isLoading = true;
    final getServiceOrder = Modular.get<GetServiceOrderByIdUsecase>();
    final result = await getServiceOrder(ArgParams(firstArgs: serviceOrderId));
    result.fold((error) => error.friendlyMessage, (success) {
      serviceOrder = success;
      _buildDataLists();
      return success;
    });

    isLoading = false;
  }

  _buildDataLists() {
      informationList = [
        ["Fazenda: ", serviceOrder?.farm?.farmName ?? ""],
        ["Safra: ", serviceOrder?.cropDiversity?.crop?.name ?? ""],
        ["Centro de Custo Local: ", serviceOrder?.costCenter?.costCenterName ?? ""],
        ["Talhões:", _buildPlotStringPreview(serviceOrder?.plots?.map((e) => e.groupName).toList() ?? [])],
        ["Área total: ", serviceOrder?.areaTotal?.toString() ?? ""]
      ];
  }

  String getNewPlantingString () {
    String type = serviceOrder?.agriculturalActivity?.activityType ?? "";
    String newPlanting = (serviceOrder?.newPlanting ?? false) ? AppStringsPortuguese.newPlanting : "";
    return type + newPlanting;
  }

  String _buildPlotStringPreview(List<String?> plots) {
    String plot = plots
        .where((plot) => plot != null)
        .cast<String>().join(', '); // Join the remaining elements
    return plot == "" ? "Sem talhões cadastrados" : plot;
  }
}