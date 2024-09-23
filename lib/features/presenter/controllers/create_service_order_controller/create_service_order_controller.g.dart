// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_service_order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateServiceOrderController on _CreateServiceOrderController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CreateServiceOrderController.isLoading', context: context);

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

  late final _$pageAtom =
      Atom(name: '_CreateServiceOrderController.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$selectAllAtom =
      Atom(name: '_CreateServiceOrderController.selectAll', context: context);

  @override
  bool get selectAll {
    _$selectAllAtom.reportRead();
    return super.selectAll;
  }

  @override
  set selectAll(bool value) {
    _$selectAllAtom.reportWrite(value, super.selectAll, () {
      super.selectAll = value;
    });
  }

  late final _$activityOptionsAtom = Atom(
      name: '_CreateServiceOrderController.activityOptions', context: context);

  @override
  List<MockEntity> get activityOptions {
    _$activityOptionsAtom.reportRead();
    return super.activityOptions;
  }

  @override
  set activityOptions(List<MockEntity> value) {
    _$activityOptionsAtom.reportWrite(value, super.activityOptions, () {
      super.activityOptions = value;
    });
  }

  late final _$costCenterOptionsAtom = Atom(
      name: '_CreateServiceOrderController.costCenterOptions',
      context: context);

  @override
  List<MockEntity> get costCenterOptions {
    _$costCenterOptionsAtom.reportRead();
    return super.costCenterOptions;
  }

  @override
  set costCenterOptions(List<MockEntity> value) {
    _$costCenterOptionsAtom.reportWrite(value, super.costCenterOptions, () {
      super.costCenterOptions = value;
    });
  }

  late final _$farmOptionsAtom =
      Atom(name: '_CreateServiceOrderController.farmOptions', context: context);

  @override
  List<MockEntity> get farmOptions {
    _$farmOptionsAtom.reportRead();
    return super.farmOptions;
  }

  @override
  set farmOptions(List<MockEntity> value) {
    _$farmOptionsAtom.reportWrite(value, super.farmOptions, () {
      super.farmOptions = value;
    });
  }

  late final _$cropOptionsAtom =
      Atom(name: '_CreateServiceOrderController.cropOptions', context: context);

  @override
  List<MockEntity> get cropOptions {
    _$cropOptionsAtom.reportRead();
    return super.cropOptions;
  }

  @override
  set cropOptions(List<MockEntity> value) {
    _$cropOptionsAtom.reportWrite(value, super.cropOptions, () {
      super.cropOptions = value;
    });
  }

  late final _$executionersAtom = Atom(
      name: '_CreateServiceOrderController.executioners', context: context);

  @override
  List<String> get executioners {
    _$executionersAtom.reportRead();
    return super.executioners;
  }

  @override
  set executioners(List<String> value) {
    _$executionersAtom.reportWrite(value, super.executioners, () {
      super.executioners = value;
    });
  }

  late final _$machineryAtom =
      Atom(name: '_CreateServiceOrderController.machinery', context: context);

  @override
  List<String> get machinery {
    _$machineryAtom.reportRead();
    return super.machinery;
  }

  @override
  set machinery(List<String> value) {
    _$machineryAtom.reportWrite(value, super.machinery, () {
      super.machinery = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_CreateServiceOrderController.products', context: context);

  @override
  List<String> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<String> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$getActivitiesAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getActivities',
      context: context);

  @override
  Future<dynamic> getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  late final _$getCostCentersAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getCostCenters',
      context: context);

  @override
  Future<dynamic> getCostCenters() {
    return _$getCostCentersAsyncAction.run(() => super.getCostCenters());
  }

  late final _$getSimplifiedFarmsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getSimplifiedFarms',
      context: context);

  @override
  Future<dynamic> getSimplifiedFarms() {
    return _$getSimplifiedFarmsAsyncAction
        .run(() => super.getSimplifiedFarms());
  }

  late final _$getSimplifiedCropsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getSimplifiedCrops',
      context: context);

  @override
  Future<dynamic> getSimplifiedCrops() {
    return _$getSimplifiedCropsAsyncAction
        .run(() => super.getSimplifiedCrops());
  }

  late final _$_CreateServiceOrderControllerActionController =
      ActionController(name: '_CreateServiceOrderController', context: context);

  @override
  dynamic toggleSelectAll() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.toggleSelectAll');
    try {
      return super.toggleSelectAll();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementPage() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.incrementPage');
    try {
      return super.incrementPage();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementPage() {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.decrementPage');
    try {
      return super.decrementPage();
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
page: ${page},
selectAll: ${selectAll},
activityOptions: ${activityOptions},
costCenterOptions: ${costCenterOptions},
farmOptions: ${farmOptions},
cropOptions: ${cropOptions},
executioners: ${executioners},
machinery: ${machinery},
products: ${products}
    ''';
  }
}
