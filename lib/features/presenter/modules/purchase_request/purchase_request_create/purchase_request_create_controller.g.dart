// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request_create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchaseRequestCreateController
    on PurchaseRequestCreateControllerAbstract, Store {
  Computed<List<dynamic>>? _$filteredAddItemsListComputed;

  @override
  List<dynamic> get filteredAddItemsList => (_$filteredAddItemsListComputed ??=
          Computed<List<dynamic>>(() => super.filteredAddItemsList,
              name:
                  'PurchaseRequestCreateControllerAbstract.filteredAddItemsList'))
      .value;
  Computed<List<SelectEntity>>? _$filteredPaymentMethodListComputed;

  @override
  List<SelectEntity> get filteredPaymentMethodList =>
      (_$filteredPaymentMethodListComputed ??= Computed<List<SelectEntity>>(
              () => super.filteredPaymentMethodList,
              name:
                  'PurchaseRequestCreateControllerAbstract.filteredPaymentMethodList'))
          .value;
  Computed<List<SelectEntity>>? _$finalRequestedCompaniesComputed;

  @override
  List<SelectEntity> get finalRequestedCompanies =>
      (_$finalRequestedCompaniesComputed ??= Computed<List<SelectEntity>>(
              () => super.finalRequestedCompanies,
              name:
                  'PurchaseRequestCreateControllerAbstract.finalRequestedCompanies'))
          .value;

  late final _$isFirstLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isFirstLoading',
      context: context);

  @override
  bool get isFirstLoading {
    _$isFirstLoadingAtom.reportRead();
    return super.isFirstLoading;
  }

  @override
  set isFirstLoading(bool value) {
    _$isFirstLoadingAtom.reportWrite(value, super.isFirstLoading, () {
      super.isFirstLoading = value;
    });
  }

  late final _$isCostCenterLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isCostCenterLoading',
      context: context);

  @override
  bool get isCostCenterLoading {
    _$isCostCenterLoadingAtom.reportRead();
    return super.isCostCenterLoading;
  }

  @override
  set isCostCenterLoading(bool value) {
    _$isCostCenterLoadingAtom.reportWrite(value, super.isCostCenterLoading, () {
      super.isCostCenterLoading = value;
    });
  }

  late final _$isFarmLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isFarmLoading',
      context: context);

  @override
  bool get isFarmLoading {
    _$isFarmLoadingAtom.reportRead();
    return super.isFarmLoading;
  }

  @override
  set isFarmLoading(bool value) {
    _$isFarmLoadingAtom.reportWrite(value, super.isFarmLoading, () {
      super.isFarmLoading = value;
    });
  }

  late final _$isEmployeeLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isEmployeeLoading',
      context: context);

  @override
  bool get isEmployeeLoading {
    _$isEmployeeLoadingAtom.reportRead();
    return super.isEmployeeLoading;
  }

  @override
  set isEmployeeLoading(bool value) {
    _$isEmployeeLoadingAtom.reportWrite(value, super.isEmployeeLoading, () {
      super.isEmployeeLoading = value;
    });
  }

  late final _$isProductLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isProductLoading',
      context: context);

  @override
  bool get isProductLoading {
    _$isProductLoadingAtom.reportRead();
    return super.isProductLoading;
  }

  @override
  set isProductLoading(bool value) {
    _$isProductLoadingAtom.reportWrite(value, super.isProductLoading, () {
      super.isProductLoading = value;
    });
  }

  late final _$isCompanyLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isCompanyLoading',
      context: context);

  @override
  bool get isCompanyLoading {
    _$isCompanyLoadingAtom.reportRead();
    return super.isCompanyLoading;
  }

  @override
  set isCompanyLoading(bool value) {
    _$isCompanyLoadingAtom.reportWrite(value, super.isCompanyLoading, () {
      super.isCompanyLoading = value;
    });
  }

  late final _$isPaymentMethodLoadingAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isPaymentMethodLoading',
      context: context);

  @override
  bool get isPaymentMethodLoading {
    _$isPaymentMethodLoadingAtom.reportRead();
    return super.isPaymentMethodLoading;
  }

  @override
  set isPaymentMethodLoading(bool value) {
    _$isPaymentMethodLoadingAtom
        .reportWrite(value, super.isPaymentMethodLoading, () {
      super.isPaymentMethodLoading = value;
    });
  }

  late final _$purchaseRequestTypeListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.purchaseRequestTypeListToSelect',
      context: context);

  @override
  List<SelectEntity> get purchaseRequestTypeListToSelect {
    _$purchaseRequestTypeListToSelectAtom.reportRead();
    return super.purchaseRequestTypeListToSelect;
  }

  @override
  set purchaseRequestTypeListToSelect(List<SelectEntity> value) {
    _$purchaseRequestTypeListToSelectAtom
        .reportWrite(value, super.purchaseRequestTypeListToSelect, () {
      super.purchaseRequestTypeListToSelect = value;
    });
  }

  late final _$costCenterListToSelectAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.costCenterListToSelect',
      context: context);

  @override
  List<SelectEntity> get costCenterListToSelect {
    _$costCenterListToSelectAtom.reportRead();
    return super.costCenterListToSelect;
  }

  @override
  set costCenterListToSelect(List<SelectEntity> value) {
    _$costCenterListToSelectAtom
        .reportWrite(value, super.costCenterListToSelect, () {
      super.costCenterListToSelect = value;
    });
  }

  late final _$farmsByCostCenterIdListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.farmsByCostCenterIdListToSelect',
      context: context);

  @override
  List<SelectEntity> get farmsByCostCenterIdListToSelect {
    _$farmsByCostCenterIdListToSelectAtom.reportRead();
    return super.farmsByCostCenterIdListToSelect;
  }

  @override
  set farmsByCostCenterIdListToSelect(List<SelectEntity> value) {
    _$farmsByCostCenterIdListToSelectAtom
        .reportWrite(value, super.farmsByCostCenterIdListToSelect, () {
      super.farmsByCostCenterIdListToSelect = value;
    });
  }

  late final _$employeeByFarmIdListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.employeeByFarmIdListToSelect',
      context: context);

  @override
  List<SelectEntity> get employeeByFarmIdListToSelect {
    _$employeeByFarmIdListToSelectAtom.reportRead();
    return super.employeeByFarmIdListToSelect;
  }

  @override
  set employeeByFarmIdListToSelect(List<SelectEntity> value) {
    _$employeeByFarmIdListToSelectAtom
        .reportWrite(value, super.employeeByFarmIdListToSelect, () {
      super.employeeByFarmIdListToSelect = value;
    });
  }

  late final _$paymentMethodListToSelectAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.paymentMethodListToSelect',
      context: context);

  @override
  List<SelectEntity> get paymentMethodListToSelect {
    _$paymentMethodListToSelectAtom.reportRead();
    return super.paymentMethodListToSelect;
  }

  @override
  set paymentMethodListToSelect(List<SelectEntity> value) {
    _$paymentMethodListToSelectAtom
        .reportWrite(value, super.paymentMethodListToSelect, () {
      super.paymentMethodListToSelect = value;
    });
  }

  late final _$productListToSelectAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.productListToSelect',
      context: context);

  @override
  List<SelectEntity> get productListToSelect {
    _$productListToSelectAtom.reportRead();
    return super.productListToSelect;
  }

  @override
  set productListToSelect(List<SelectEntity> value) {
    _$productListToSelectAtom.reportWrite(value, super.productListToSelect, () {
      super.productListToSelect = value;
    });
  }

  late final _$productTypesListToSelectAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.productTypesListToSelect',
      context: context);

  @override
  List<SelectEntity> get productTypesListToSelect {
    _$productTypesListToSelectAtom.reportRead();
    return super.productTypesListToSelect;
  }

  @override
  set productTypesListToSelect(List<SelectEntity> value) {
    _$productTypesListToSelectAtom
        .reportWrite(value, super.productTypesListToSelect, () {
      super.productTypesListToSelect = value;
    });
  }

  late final _$filteredProductTypeListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.filteredProductTypeListToSelect',
      context: context);

  @override
  List<SelectEntity> get filteredProductTypeListToSelect {
    _$filteredProductTypeListToSelectAtom.reportRead();
    return super.filteredProductTypeListToSelect;
  }

  @override
  set filteredProductTypeListToSelect(List<SelectEntity> value) {
    _$filteredProductTypeListToSelectAtom
        .reportWrite(value, super.filteredProductTypeListToSelect, () {
      super.filteredProductTypeListToSelect = value;
    });
  }

  late final _$companiesListToSelectAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.companiesListToSelect',
      context: context);

  @override
  List<SelectEntity> get companiesListToSelect {
    _$companiesListToSelectAtom.reportRead();
    return super.companiesListToSelect;
  }

  @override
  set companiesListToSelect(List<SelectEntity> value) {
    _$companiesListToSelectAtom.reportWrite(value, super.companiesListToSelect,
        () {
      super.companiesListToSelect = value;
    });
  }

  late final _$companiesListAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.companiesList',
      context: context);

  @override
  List<CompanyEntity> get companiesList {
    _$companiesListAtom.reportRead();
    return super.companiesList;
  }

  @override
  set companiesList(List<CompanyEntity> value) {
    _$companiesListAtom.reportWrite(value, super.companiesList, () {
      super.companiesList = value;
    });
  }

  late final _$companySegmentsListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.companySegmentsListToSelect',
      context: context);

  @override
  List<SelectEntity> get companySegmentsListToSelect {
    _$companySegmentsListToSelectAtom.reportRead();
    return super.companySegmentsListToSelect;
  }

  @override
  set companySegmentsListToSelect(List<SelectEntity> value) {
    _$companySegmentsListToSelectAtom
        .reportWrite(value, super.companySegmentsListToSelect, () {
      super.companySegmentsListToSelect = value;
    });
  }

  late final _$filteredCompanySegmentsListToSelectAtom = Atom(
      name:
          'PurchaseRequestCreateControllerAbstract.filteredCompanySegmentsListToSelect',
      context: context);

  @override
  List<SelectEntity> get filteredCompanySegmentsListToSelect {
    _$filteredCompanySegmentsListToSelectAtom.reportRead();
    return super.filteredCompanySegmentsListToSelect;
  }

  @override
  set filteredCompanySegmentsListToSelect(List<SelectEntity> value) {
    _$filteredCompanySegmentsListToSelectAtom
        .reportWrite(value, super.filteredCompanySegmentsListToSelect, () {
      super.filteredCompanySegmentsListToSelect = value;
    });
  }

  late final _$cityFilterTextAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.cityFilterText',
      context: context);

  @override
  String get cityFilterText {
    _$cityFilterTextAtom.reportRead();
    return super.cityFilterText;
  }

  @override
  set cityFilterText(String value) {
    _$cityFilterTextAtom.reportWrite(value, super.cityFilterText, () {
      super.cityFilterText = value;
    });
  }

  late final _$stateFilterTextAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.stateFilterText',
      context: context);

  @override
  String get stateFilterText {
    _$stateFilterTextAtom.reportRead();
    return super.stateFilterText;
  }

  @override
  set stateFilterText(String value) {
    _$stateFilterTextAtom.reportWrite(value, super.stateFilterText, () {
      super.stateFilterText = value;
    });
  }

  late final _$selectedCompanyIdsAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.selectedCompanyIds',
      context: context);

  @override
  ObservableSet<int> get selectedCompanyIds {
    _$selectedCompanyIdsAtom.reportRead();
    return super.selectedCompanyIds;
  }

  @override
  set selectedCompanyIds(ObservableSet<int> value) {
    _$selectedCompanyIdsAtom.reportWrite(value, super.selectedCompanyIds, () {
      super.selectedCompanyIds = value;
    });
  }

  late final _$requestedProductItemsAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.requestedProductItems',
      context: context);

  @override
  List<ItemsEntity> get requestedProductItems {
    _$requestedProductItemsAtom.reportRead();
    return super.requestedProductItems;
  }

  @override
  set requestedProductItems(List<ItemsEntity> value) {
    _$requestedProductItemsAtom.reportWrite(value, super.requestedProductItems,
        () {
      super.requestedProductItems = value;
    });
  }

  late final _$finalRequestedProductsAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.finalRequestedProducts',
      context: context);

  @override
  List<ItemsEntity> get finalRequestedProducts {
    _$finalRequestedProductsAtom.reportRead();
    return super.finalRequestedProducts;
  }

  @override
  set finalRequestedProducts(List<ItemsEntity> value) {
    _$finalRequestedProductsAtom
        .reportWrite(value, super.finalRequestedProducts, () {
      super.finalRequestedProducts = value;
    });
  }

  late final _$purchaseRequestTypeAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.purchaseRequestType',
      context: context);

  @override
  SelectEntity? get purchaseRequestType {
    _$purchaseRequestTypeAtom.reportRead();
    return super.purchaseRequestType;
  }

  @override
  set purchaseRequestType(SelectEntity? value) {
    _$purchaseRequestTypeAtom.reportWrite(value, super.purchaseRequestType, () {
      super.purchaseRequestType = value;
    });
  }

  late final _$costCenterAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.costCenter',
      context: context);

  @override
  SelectEntity? get costCenter {
    _$costCenterAtom.reportRead();
    return super.costCenter;
  }

  @override
  set costCenter(SelectEntity? value) {
    _$costCenterAtom.reportWrite(value, super.costCenter, () {
      super.costCenter = value;
    });
  }

  late final _$farmAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.farm', context: context);

  @override
  SelectEntity? get farm {
    _$farmAtom.reportRead();
    return super.farm;
  }

  @override
  set farm(SelectEntity? value) {
    _$farmAtom.reportWrite(value, super.farm, () {
      super.farm = value;
    });
  }

  late final _$paymentMethodAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.paymentMethod',
      context: context);

  @override
  SelectEntity? get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(SelectEntity? value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  late final _$searchQueryAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.searchQuery',
      context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$currentLoadedItemTypeAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.currentLoadedItemType',
      context: context);

  @override
  ItemType? get currentLoadedItemType {
    _$currentLoadedItemTypeAtom.reportRead();
    return super.currentLoadedItemType;
  }

  @override
  set currentLoadedItemType(ItemType? value) {
    _$currentLoadedItemTypeAtom.reportWrite(value, super.currentLoadedItemType,
        () {
      super.currentLoadedItemType = value;
    });
  }

  late final _$isUrgentAtom = Atom(
      name: 'PurchaseRequestCreateControllerAbstract.isUrgent',
      context: context);

  @override
  bool get isUrgent {
    _$isUrgentAtom.reportRead();
    return super.isUrgent;
  }

  @override
  set isUrgent(bool value) {
    _$isUrgentAtom.reportWrite(value, super.isUrgent, () {
      super.isUrgent = value;
    });
  }

  late final _$getAllProductsToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllProductsToSelect',
      context: context);

  @override
  Future<void> getAllProductsToSelect() {
    return _$getAllProductsToSelectAsyncAction
        .run(() => super.getAllProductsToSelect());
  }

  late final _$getAllProductTypesToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllProductTypesToSelect',
      context: context);

  @override
  Future<void> getAllProductTypesToSelect() {
    return _$getAllProductTypesToSelectAsyncAction
        .run(() => super.getAllProductTypesToSelect());
  }

  late final _$applyProductFiltersAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.applyProductFilters',
      context: context);

  @override
  Future<void> applyProductFilters() {
    return _$applyProductFiltersAsyncAction
        .run(() => super.applyProductFilters());
  }

  late final _$getAllCompaniesAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllCompanies',
      context: context);

  @override
  Future<void> getAllCompanies() {
    return _$getAllCompaniesAsyncAction.run(() => super.getAllCompanies());
  }

  late final _$getAllCompaniesToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllCompaniesToSelect',
      context: context);

  @override
  Future<void> getAllCompaniesToSelect() {
    return _$getAllCompaniesToSelectAsyncAction
        .run(() => super.getAllCompaniesToSelect());
  }

  late final _$getAllCompanySegmentsToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllCompanySegmentsToSelect',
      context: context);

  @override
  Future<void> getAllCompanySegmentsToSelect() {
    return _$getAllCompanySegmentsToSelectAsyncAction
        .run(() => super.getAllCompanySegmentsToSelect());
  }

  late final _$applyCompanyFiltersAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.applyCompanyFilters',
      context: context);

  @override
  Future<void> applyCompanyFilters() {
    return _$applyCompanyFiltersAsyncAction
        .run(() => super.applyCompanyFilters());
  }

  late final _$loadItemsAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.loadItems',
      context: context);

  @override
  Future<void> loadItems(ItemType type) {
    return _$loadItemsAsyncAction.run(() => super.loadItems(type));
  }

  late final _$getAllPaymentMethodsToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllPaymentMethodsToSelect',
      context: context);

  @override
  Future<void> getAllPaymentMethodsToSelect() {
    return _$getAllPaymentMethodsToSelectAsyncAction
        .run(() => super.getAllPaymentMethodsToSelect());
  }

  late final _$getAllPurchaseRequestTypeToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllPurchaseRequestTypeToSelect',
      context: context);

  @override
  Future<void> getAllPurchaseRequestTypeToSelect() {
    return _$getAllPurchaseRequestTypeToSelectAsyncAction
        .run(() => super.getAllPurchaseRequestTypeToSelect());
  }

  late final _$getAllCostCenterToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllCostCenterToSelect',
      context: context);

  @override
  Future<void> getAllCostCenterToSelect() {
    return _$getAllCostCenterToSelectAsyncAction
        .run(() => super.getAllCostCenterToSelect());
  }

  late final _$getAllFarmsByCostCenterIdToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllFarmsByCostCenterIdToSelect',
      context: context);

  @override
  Future<void> getAllFarmsByCostCenterIdToSelect(int costCenterId) {
    return _$getAllFarmsByCostCenterIdToSelectAsyncAction
        .run(() => super.getAllFarmsByCostCenterIdToSelect(costCenterId));
  }

  late final _$getAllEmployeesByFarmIdToSelectAsyncAction = AsyncAction(
      'PurchaseRequestCreateControllerAbstract.getAllEmployeesByFarmIdToSelect',
      context: context);

  @override
  Future<void> getAllEmployeesByFarmIdToSelect(int farmId) {
    return _$getAllEmployeesByFarmIdToSelectAsyncAction
        .run(() => super.getAllEmployeesByFarmIdToSelect(farmId));
  }

  late final _$PurchaseRequestCreateControllerAbstractActionController =
      ActionController(
          name: 'PurchaseRequestCreateControllerAbstract', context: context);

  @override
  void updateSearchQuery(String query) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.updateSearchQuery');
    try {
      return super.updateSearchQuery(query);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateCostCenterAndReload(SelectEntity costCenter) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateCostCenterAndReload');
    try {
      return super.updateCostCenterAndReload(costCenter);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateFarmAndReload(SelectEntity farm) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateFarmAndReload');
    try {
      return super.updateFarmAndReload(farm);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateEmployee(SelectEntity employee) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.updateEmployee');
    try {
      return super.updateEmployee(employee);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateRequestItems(int index) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.updateRequestItems');
    try {
      return super.updateRequestItems(index);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateRequestItemsQuantity({required int id, required int value}) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateRequestItemsQuantity');
    try {
      return super.updateRequestItemsQuantity(id: id, value: value);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void incrementRequestedProductQuantity(int productId) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.incrementRequestedProductQuantity');
    try {
      return super.incrementRequestedProductQuantity(productId);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void decrementRequestedProductQuantity(int productId) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.decrementRequestedProductQuantity');
    try {
      return super.decrementRequestedProductQuantity(productId);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeRequestedProduct(int productId) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.removeRequestedProduct');
    try {
      return super.removeRequestedProduct(productId);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedProductTypes(Set<int> selectedIds) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateSelectedProductTypes');
    try {
      return super.updateSelectedProductTypes(selectedIds);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedProductTypes() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.clearSelectedProductTypes');
    try {
      return super.clearSelectedProductTypes();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalRequestedProducts() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateFinalRequestedProducts');
    try {
      return super.updateFinalRequestedProducts();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleCompanySelection(int companyId, bool isSelected) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.toggleCompanySelection');
    try {
      return super.toggleCompanySelection(companyId, isSelected);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedCompany(int companyId) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.removeSelectedCompany');
    try {
      return super.removeSelectedCompany(companyId);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedCompanySegments(Set<int> selectedIds) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updateSelectedCompanySegments');
    try {
      return super.updateSelectedCompanySegments(selectedIds);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedCompanySegments() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.clearSelectedCompanySegments');
    try {
      return super.clearSelectedCompanySegments();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateStateFilter(String text) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.updateStateFilter');
    try {
      return super.updateStateFilter(text);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updateCityFilter(String text) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.updateCityFilter');
    try {
      return super.updateCityFilter(text);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void applyCityFilter() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.applyCityFilter');
    try {
      return super.applyCityFilter();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedCityFilter() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.clearSelectedCityFilter');
    try {
      return super.clearSelectedCityFilter();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void updatePaymentMethod(SelectEntity selectedMethod) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name:
                'PurchaseRequestCreateControllerAbstract.updatePaymentMethod');
    try {
      return super.updatePaymentMethod(selectedMethod);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsUrgent(bool? newValue) {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.toggleIsUrgent');
    try {
      return super.toggleIsUrgent(newValue);
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo =
        _$PurchaseRequestCreateControllerAbstractActionController.startAction(
            name: 'PurchaseRequestCreateControllerAbstract.resetState');
    try {
      return super.resetState();
    } finally {
      _$PurchaseRequestCreateControllerAbstractActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstLoading: ${isFirstLoading},
isCostCenterLoading: ${isCostCenterLoading},
isFarmLoading: ${isFarmLoading},
isEmployeeLoading: ${isEmployeeLoading},
isProductLoading: ${isProductLoading},
isCompanyLoading: ${isCompanyLoading},
isPaymentMethodLoading: ${isPaymentMethodLoading},
purchaseRequestTypeListToSelect: ${purchaseRequestTypeListToSelect},
costCenterListToSelect: ${costCenterListToSelect},
farmsByCostCenterIdListToSelect: ${farmsByCostCenterIdListToSelect},
employeeByFarmIdListToSelect: ${employeeByFarmIdListToSelect},
paymentMethodListToSelect: ${paymentMethodListToSelect},
productListToSelect: ${productListToSelect},
productTypesListToSelect: ${productTypesListToSelect},
filteredProductTypeListToSelect: ${filteredProductTypeListToSelect},
companiesListToSelect: ${companiesListToSelect},
companiesList: ${companiesList},
companySegmentsListToSelect: ${companySegmentsListToSelect},
filteredCompanySegmentsListToSelect: ${filteredCompanySegmentsListToSelect},
cityFilterText: ${cityFilterText},
stateFilterText: ${stateFilterText},
selectedCompanyIds: ${selectedCompanyIds},
requestedProductItems: ${requestedProductItems},
finalRequestedProducts: ${finalRequestedProducts},
purchaseRequestType: ${purchaseRequestType},
costCenter: ${costCenter},
farm: ${farm},
paymentMethod: ${paymentMethod},
searchQuery: ${searchQuery},
currentLoadedItemType: ${currentLoadedItemType},
isUrgent: ${isUrgent},
filteredAddItemsList: ${filteredAddItemsList},
filteredPaymentMethodList: ${filteredPaymentMethodList},
finalRequestedCompanies: ${finalRequestedCompanies}
    ''';
  }
}
