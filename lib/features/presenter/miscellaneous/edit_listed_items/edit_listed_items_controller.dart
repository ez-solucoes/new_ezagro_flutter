import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/company_usecases/get_all_companies_to_select_usecase/get_all_companies_to_select_usecase.dart';

part 'edit_listed_items_controller.g.dart';

class EditListedItemsController = EditListedItemsPageAbstract with _$EditListedItemsController;

abstract class EditListedItemsPageAbstract with Store {
  @observable
  bool isLoading = false;

  @observable
  List<SelectEntity> autoCompleteList = ObservableList<SelectEntity>();

  @action
  Future<void> getAllCompaniesToSelect() async {
    isLoading = true;

    final getAllCompaniesToSelectUsecase = Modular.get<GetAllCompaniesToSelectUsecase>();
    final result = await getAllCompaniesToSelectUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      autoCompleteList = success;
      return success;
    });

    isLoading = false;
  }

}