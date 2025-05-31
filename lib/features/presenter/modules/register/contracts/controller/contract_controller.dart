
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/contract_usecases/get_contract_list_usecase/get_contract_list_usecase.dart';

import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/contract_entities/contract_entity.dart';
import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../../domain/usecases/contract_usecases/get_contract_by_id_usecase/get_contract_by_id_usecase.dart';

part 'contract_controller.g.dart';

class ContractController = ContractControllerAbstract with _$ContractController;

abstract class ContractControllerAbstract with Store {


  @observable
  bool isLoading = false;

  @observable
  List<ContractEntity> contracts = ObservableList();

  @observable
  List<ContractEntity> filteredContracts = ObservableList();

  @observable
  ContractEntity? contract;

  @action
  Future getContractsList() async {
    isLoading = true;
    final getContracts = Modular.get<GetContractListUsecase>();
    final result = await getContracts(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      contracts = success;
      filteredContracts = contracts;
      return success;
    });

    isLoading = false;
  }

  @action
  Future getContractById(ArgParams args) async {
    isLoading = true;
    final getContract = Modular.get<GetContractByIdUsecase>();
    final result = await getContract(args);
    result.fold((error) => error.friendlyMessage, (success) {
      contract = success;
      return success;
    });

    isLoading = false;
  }

  @action
  void searchContract(String searchText) {
    filteredContracts = contracts.where((e) =>
    (e.contract?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.contractType?.name?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
