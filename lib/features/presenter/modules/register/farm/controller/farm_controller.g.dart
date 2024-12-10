// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FarmController on FarmControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'FarmControllerAbstract.isLoading', context: context);

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

  late final _$farmsAtom =
      Atom(name: 'FarmControllerAbstract.farms', context: context);

  @override
  List<FarmEntity> get farms {
    _$farmsAtom.reportRead();
    return super.farms;
  }

  @override
  set farms(List<FarmEntity> value) {
    _$farmsAtom.reportWrite(value, super.farms, () {
      super.farms = value;
    });
  }

  late final _$filteredFarmsAtom =
      Atom(name: 'FarmControllerAbstract.filteredFarms', context: context);

  @override
  List<FarmEntity> get filteredFarms {
    _$filteredFarmsAtom.reportRead();
    return super.filteredFarms;
  }

  @override
  set filteredFarms(List<FarmEntity> value) {
    _$filteredFarmsAtom.reportWrite(value, super.filteredFarms, () {
      super.filteredFarms = value;
    });
  }

  late final _$farmAtom =
      Atom(name: 'FarmControllerAbstract.farm', context: context);

  @override
  FarmEntity? get farm {
    _$farmAtom.reportRead();
    return super.farm;
  }

  @override
  set farm(FarmEntity? value) {
    _$farmAtom.reportWrite(value, super.farm, () {
      super.farm = value;
    });
  }

  late final _$getFarmsListAsyncAction =
      AsyncAction('FarmControllerAbstract.getFarmsList', context: context);

  @override
  Future<dynamic> getFarmsList() {
    return _$getFarmsListAsyncAction.run(() => super.getFarmsList());
  }

  late final _$getFarmByIdAsyncAction =
      AsyncAction('FarmControllerAbstract.getFarmById', context: context);

  @override
  Future<dynamic> getFarmById(ArgParams args) {
    return _$getFarmByIdAsyncAction.run(() => super.getFarmById(args));
  }

  late final _$FarmControllerAbstractActionController =
      ActionController(name: 'FarmControllerAbstract', context: context);

  @override
  dynamic searchFarm(String searchText) {
    final _$actionInfo = _$FarmControllerAbstractActionController.startAction(
        name: 'FarmControllerAbstract.searchFarm');
    try {
      return super.searchFarm(searchText);
    } finally {
      _$FarmControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
farms: ${farms},
filteredFarms: ${filteredFarms},
farm: ${farm}
    ''';
  }
}
