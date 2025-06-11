import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_implement_usecases/get_all_machinery_implement_usecases/get_all_machinery_implements_usecase.dart';

import '../../../../domain/usecases/machinery_implement_usecases/get_machinery_implement_by_id/get_machinery_implement_by_id_usecase.dart';

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
  Future<void> getAllMachineryImplements() async {
    isLoading = true;
    final getAllMachineryImplementsUsecase = Modular.get<GetAllMachineryImplementsUsecase>();

    final result = await getAllMachineryImplementsUsecase(NoParams());

    result.fold((error) {
      errorMessage = error.friendlyMessage;
    }, (success) {
      for (var machineryImplementEntity in success.data!) {
        machineryImplementList.add(machineryImplementEntity);
      }

      if (machineryImplementList.isEmpty) {
        errorMessage = 'Nenhum dado encontrado';
      }
    });
    isLoading = false;
  }

  Future<void> getMachineryImplementById(int id) async {
    isLoading = true;
    final getMachineryImplementByIdUsecase = Modular.get<GetMachineryImplementByIdUsecase>();
    final result = await getMachineryImplementByIdUsecase(ArgParams(firstArgs: id));

    result.fold((error) {
      errorMessage = error.friendlyMessage;
    }, (success) {
      machineryImplementEntity = success.data!;
    });
    isLoading = false;
  }
}
