// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContractController on ContractControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ContractControllerAbstract.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$contractsAtom =
      Atom(name: 'ContractControllerAbstract.contracts', context: context);

  @override
  List<ContractEntity> get contracts {
    _$contractsAtom.reportRead();
    return super.contracts;
  }

  @override
  set contracts(List<ContractEntity> value) {
    _$contractsAtom.reportWrite(value, super.contracts, () {
      super.contracts = value;
    });
  }

  late final _$filteredContractsAtom = Atom(
      name: 'ContractControllerAbstract.filteredContracts', context: context);

  @override
  List<ContractEntity> get filteredContracts {
    _$filteredContractsAtom.reportRead();
    return super.filteredContracts;
  }

  @override
  set filteredContracts(List<ContractEntity> value) {
    _$filteredContractsAtom.reportWrite(value, super.filteredContracts, () {
      super.filteredContracts = value;
    });
  }

  late final _$contractAtom =
      Atom(name: 'ContractControllerAbstract.contract', context: context);

  @override
  ContractEntity? get contract {
    _$contractAtom.reportRead();
    return super.contract;
  }

  @override
  set contract(ContractEntity? value) {
    _$contractAtom.reportWrite(value, super.contract, () {
      super.contract = value;
    });
  }

  late final _$getContractsListAsyncAction = AsyncAction(
      'ContractControllerAbstract.getContractsList',
      context: context);

  @override
  Future<dynamic> getContractsList() {
    return _$getContractsListAsyncAction.run(() => super.getContractsList());
  }

  late final _$getContractByIdAsyncAction = AsyncAction(
      'ContractControllerAbstract.getContractById',
      context: context);

  @override
  Future<dynamic> getContractById(ArgParams args) {
    return _$getContractByIdAsyncAction.run(() => super.getContractById(args));
  }

  late final _$ContractControllerAbstractActionController =
      ActionController(name: 'ContractControllerAbstract', context: context);

  @override
  void searchContract(String searchText) {
    final _$actionInfo = _$ContractControllerAbstractActionController
        .startAction(name: 'ContractControllerAbstract.searchContract');
    try {
      return super.searchContract(searchText);
    } finally {
      _$ContractControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
contracts: ${contracts},
filteredContracts: ${filteredContracts},
contract: ${contract}
    ''';
  }
}
