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

  late final _$isLastPageAtom =
      Atom(name: '_CreateServiceOrderController.isLastPage', context: context);

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
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
  List<AgriculturalActivityEntity> get activityOptions {
    _$activityOptionsAtom.reportRead();
    return super.activityOptions;
  }

  @override
  set activityOptions(List<AgriculturalActivityEntity> value) {
    _$activityOptionsAtom.reportWrite(value, super.activityOptions, () {
      super.activityOptions = value;
    });
  }

  late final _$costCenterOptionsAtom = Atom(
      name: '_CreateServiceOrderController.costCenterOptions',
      context: context);

  @override
  List<CostCenterEntity> get costCenterOptions {
    _$costCenterOptionsAtom.reportRead();
    return super.costCenterOptions;
  }

  @override
  set costCenterOptions(List<CostCenterEntity> value) {
    _$costCenterOptionsAtom.reportWrite(value, super.costCenterOptions, () {
      super.costCenterOptions = value;
    });
  }

  late final _$farmOptionsAtom =
      Atom(name: '_CreateServiceOrderController.farmOptions', context: context);

  @override
  List<FarmEntity> get farmOptions {
    _$farmOptionsAtom.reportRead();
    return super.farmOptions;
  }

  @override
  set farmOptions(List<FarmEntity> value) {
    _$farmOptionsAtom.reportWrite(value, super.farmOptions, () {
      super.farmOptions = value;
    });
  }

  late final _$cropOptionsAtom =
      Atom(name: '_CreateServiceOrderController.cropOptions', context: context);

  @override
  List<CropEntity> get cropOptions {
    _$cropOptionsAtom.reportRead();
    return super.cropOptions;
  }

  @override
  set cropOptions(List<CropEntity> value) {
    _$cropOptionsAtom.reportWrite(value, super.cropOptions, () {
      super.cropOptions = value;
    });
  }

  late final _$executorsOptionsAtom = Atom(
      name: '_CreateServiceOrderController.executorsOptions', context: context);

  @override
  List<EmployeeEntity> get executorsOptions {
    _$executorsOptionsAtom.reportRead();
    return super.executorsOptions;
  }

  @override
  set executorsOptions(List<EmployeeEntity> value) {
    _$executorsOptionsAtom.reportWrite(value, super.executorsOptions, () {
      super.executorsOptions = value;
    });
  }

  late final _$machineryOptionsAtom = Atom(
      name: '_CreateServiceOrderController.machineryOptions', context: context);

  @override
  List<MachineImplementEntity> get machineryOptions {
    _$machineryOptionsAtom.reportRead();
    return super.machineryOptions;
  }

  @override
  set machineryOptions(List<MachineImplementEntity> value) {
    _$machineryOptionsAtom.reportWrite(value, super.machineryOptions, () {
      super.machineryOptions = value;
    });
  }

  late final _$productsOptionsAtom = Atom(
      name: '_CreateServiceOrderController.productsOptions', context: context);

  @override
  List<ProductEntity> get productsOptions {
    _$productsOptionsAtom.reportRead();
    return super.productsOptions;
  }

  @override
  set productsOptions(List<ProductEntity> value) {
    _$productsOptionsAtom.reportWrite(value, super.productsOptions, () {
      super.productsOptions = value;
    });
  }

  late final _$employeeOptionsAtom = Atom(
      name: '_CreateServiceOrderController.employeeOptions', context: context);

  @override
  List<EmployeeEntity> get employeeOptions {
    _$employeeOptionsAtom.reportRead();
    return super.employeeOptions;
  }

  @override
  set employeeOptions(List<EmployeeEntity> value) {
    _$employeeOptionsAtom.reportWrite(value, super.employeeOptions, () {
      super.employeeOptions = value;
    });
  }

  late final _$plotsOptionsAtom = Atom(
      name: '_CreateServiceOrderController.plotsOptions', context: context);

  @override
  List<PlotEntity> get plotsOptions {
    _$plotsOptionsAtom.reportRead();
    return super.plotsOptions;
  }

  @override
  set plotsOptions(List<PlotEntity> value) {
    _$plotsOptionsAtom.reportWrite(value, super.plotsOptions, () {
      super.plotsOptions = value;
    });
  }

  late final _$selectedPlotsAtom = Atom(
      name: '_CreateServiceOrderController.selectedPlots', context: context);

  @override
  List<int> get selectedPlots {
    _$selectedPlotsAtom.reportRead();
    return super.selectedPlots;
  }

  @override
  set selectedPlots(List<int> value) {
    _$selectedPlotsAtom.reportWrite(value, super.selectedPlots, () {
      super.selectedPlots = value;
    });
  }

  late final _$selectedMachineryAtom = Atom(
      name: '_CreateServiceOrderController.selectedMachinery',
      context: context);

  @override
  List<String> get selectedMachinery {
    _$selectedMachineryAtom.reportRead();
    return super.selectedMachinery;
  }

  @override
  set selectedMachinery(List<String> value) {
    _$selectedMachineryAtom.reportWrite(value, super.selectedMachinery, () {
      super.selectedMachinery = value;
    });
  }

  late final _$selectedProductsAtom = Atom(
      name: '_CreateServiceOrderController.selectedProducts', context: context);

  @override
  List<String> get selectedProducts {
    _$selectedProductsAtom.reportRead();
    return super.selectedProducts;
  }

  @override
  set selectedProducts(List<String> value) {
    _$selectedProductsAtom.reportWrite(value, super.selectedProducts, () {
      super.selectedProducts = value;
    });
  }

  late final _$selectedExecutorsAtom = Atom(
      name: '_CreateServiceOrderController.selectedExecutors',
      context: context);

  @override
  List<String> get selectedExecutors {
    _$selectedExecutorsAtom.reportRead();
    return super.selectedExecutors;
  }

  @override
  set selectedExecutors(List<String> value) {
    _$selectedExecutorsAtom.reportWrite(value, super.selectedExecutors, () {
      super.selectedExecutors = value;
    });
  }

  late final _$activityAtom =
      Atom(name: '_CreateServiceOrderController.activity', context: context);

  @override
  AgriculturalActivityEntity? get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(AgriculturalActivityEntity? value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  late final _$isSelectingAtom =
      Atom(name: '_CreateServiceOrderController.isSelecting', context: context);

  @override
  bool get isSelecting {
    _$isSelectingAtom.reportRead();
    return super.isSelecting;
  }

  @override
  set isSelecting(bool value) {
    _$isSelectingAtom.reportWrite(value, super.isSelecting, () {
      super.isSelecting = value;
    });
  }

  late final _$startIndexAtom =
      Atom(name: '_CreateServiceOrderController.startIndex', context: context);

  @override
  int get startIndex {
    _$startIndexAtom.reportRead();
    return super.startIndex;
  }

  @override
  set startIndex(int value) {
    _$startIndexAtom.reportWrite(value, super.startIndex, () {
      super.startIndex = value;
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

  late final _$getPlotsOptionsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getPlotsOptions',
      context: context);

  @override
  Future<dynamic> getPlotsOptions() {
    return _$getPlotsOptionsAsyncAction.run(() => super.getPlotsOptions());
  }

  late final _$getExecutorOptionsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getExecutorOptions',
      context: context);

  @override
  Future<dynamic> getExecutorOptions() {
    return _$getExecutorOptionsAsyncAction
        .run(() => super.getExecutorOptions());
  }

  late final _$getMachineryAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getMachinery',
      context: context);

  @override
  Future<dynamic> getMachinery() {
    return _$getMachineryAsyncAction.run(() => super.getMachinery());
  }

  late final _$getProductsOptionsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getProductsOptions',
      context: context);

  @override
  Future<dynamic> getProductsOptions() {
    return _$getProductsOptionsAsyncAction
        .run(() => super.getProductsOptions());
  }

  late final _$getEmployeeOptionsAsyncAction = AsyncAction(
      '_CreateServiceOrderController.getEmployeeOptions',
      context: context);

  @override
  Future<dynamic> getEmployeeOptions() {
    return _$getEmployeeOptionsAsyncAction
        .run(() => super.getEmployeeOptions());
  }

  late final _$createServiceOrderAsyncAction = AsyncAction(
      '_CreateServiceOrderController.createServiceOrder',
      context: context);

  @override
  Future<dynamic> createServiceOrder() {
    return _$createServiceOrderAsyncAction
        .run(() => super.createServiceOrder());
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
  void onLongPressEnd(LongPressEndDetails details) {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.onLongPressEnd');
    try {
      return super.onLongPressEnd(details);
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onLongPressUpdate(LongPressMoveUpdateDetails details) {
    final _$actionInfo = _$_CreateServiceOrderControllerActionController
        .startAction(name: '_CreateServiceOrderController.onLongPressUpdate');
    try {
      return super.onLongPressUpdate(details);
    } finally {
      _$_CreateServiceOrderControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLastPage: ${isLastPage},
page: ${page},
selectAll: ${selectAll},
activityOptions: ${activityOptions},
costCenterOptions: ${costCenterOptions},
farmOptions: ${farmOptions},
cropOptions: ${cropOptions},
executorsOptions: ${executorsOptions},
machineryOptions: ${machineryOptions},
productsOptions: ${productsOptions},
employeeOptions: ${employeeOptions},
plotsOptions: ${plotsOptions},
selectedPlots: ${selectedPlots},
selectedMachinery: ${selectedMachinery},
selectedProducts: ${selectedProducts},
selectedExecutors: ${selectedExecutors},
activity: ${activity},
isSelecting: ${isSelecting},
startIndex: ${startIndex}
    ''';
  }
}
