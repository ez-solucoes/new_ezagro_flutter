import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';

import '../../../../domain/usecases/machinery_usecases/get_all_machinery_usecases/get_all_machinery_usecase.dart';
import '../../../../domain/usecases/machinery_usecases/get_machinery_implement_by_id/get_machinery_implement_by_id_usecase.dart';

part 'machinery_controller.g.dart';

class MachineryController = MachineryControllerAbstract with _$MachineryController;

abstract class MachineryControllerAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  MachineryImplementEntity machineryImplementEntity = MachineryImplementEntity();

  @observable
  List<MachineryImplementEntity> machineryImplementList = [];

  @observable
  String errorMessage = '';

  @action
  getAllMachineryImplements() async {
    isLoading = true;
    final getAllMachineryUsecase = Modular.get<GetAllMachineryUsecase>();

    final result = await getAllMachineryUsecase(NoParams());

    result.fold((error) {
      errorMessage = error.friendlyMessage;
    }, (success) {
      for (var machineryImplementEntity in success) {
        machineryImplementList.add(machineryImplementEntity);
      }

      if (machineryImplementList.isEmpty) {
        errorMessage = 'Nenhum dado encontrado';
      }
    });
    isLoading = false;
  }

  getMachineryImplementById(int id) async {
    isLoading = true;
    final getMachineryImplementByIdUsecase = Modular.get<GetMachineryImplementByIdUsecase>();
    final result = await getMachineryImplementByIdUsecase(id);

    result.fold((error) {
      errorMessage = error.friendlyMessage;
    }, (success) {
      machineryImplementEntity = success.data!;
    });
    isLoading = false;
  }
}
