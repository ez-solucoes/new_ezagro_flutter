// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_selection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemSelectionController on ItemSelectionControllerAbstract, Store {
  Computed<List<dynamic>>? _$filteredAddItemsListComputed;

  @override
  List<dynamic> get filteredAddItemsList => (_$filteredAddItemsListComputed ??=
          Computed<List<dynamic>>(() => super.filteredAddItemsList,
              name: 'ItemSelectionControllerAbstract.filteredAddItemsList'))
      .value;

  late final _$agriculturalInputCurrentPageAtom = Atom(
      name: 'ItemSelectionControllerAbstract.agriculturalInputCurrentPage',
      context: context);

  @override
  int get agriculturalInputCurrentPage {
    _$agriculturalInputCurrentPageAtom.reportRead();
    return super.agriculturalInputCurrentPage;
  }

  @override
  set agriculturalInputCurrentPage(int value) {
    _$agriculturalInputCurrentPageAtom
        .reportWrite(value, super.agriculturalInputCurrentPage, () {
      super.agriculturalInputCurrentPage = value;
    });
  }

  late final _$isAgriculturalInputLoadingMoreAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isAgriculturalInputLoadingMore',
      context: context);

  @override
  bool get isAgriculturalInputLoadingMore {
    _$isAgriculturalInputLoadingMoreAtom.reportRead();
    return super.isAgriculturalInputLoadingMore;
  }

  @override
  set isAgriculturalInputLoadingMore(bool value) {
    _$isAgriculturalInputLoadingMoreAtom
        .reportWrite(value, super.isAgriculturalInputLoadingMore, () {
      super.isAgriculturalInputLoadingMore = value;
    });
  }

  late final _$hasMoreAgriculturalInputsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.hasMoreAgriculturalInputs',
      context: context);

  @override
  bool get hasMoreAgriculturalInputs {
    _$hasMoreAgriculturalInputsAtom.reportRead();
    return super.hasMoreAgriculturalInputs;
  }

  @override
  set hasMoreAgriculturalInputs(bool value) {
    _$hasMoreAgriculturalInputsAtom
        .reportWrite(value, super.hasMoreAgriculturalInputs, () {
      super.hasMoreAgriculturalInputs = value;
    });
  }

  late final _$isFirstLoadingAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isFirstLoading', context: context);

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

  late final _$currentLoadedItemTypeAtom = Atom(
      name: 'ItemSelectionControllerAbstract.currentLoadedItemType',
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

  late final _$searchQueryAtom = Atom(
      name: 'ItemSelectionControllerAbstract.searchQuery', context: context);

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

  late final _$isProductLoadingAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isProductLoading',
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

  late final _$isProductTypeLoadingAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isProductTypeLoading',
      context: context);

  @override
  bool get isProductTypeLoading {
    _$isProductTypeLoadingAtom.reportRead();
    return super.isProductTypeLoading;
  }

  @override
  set isProductTypeLoading(bool value) {
    _$isProductTypeLoadingAtom.reportWrite(value, super.isProductTypeLoading,
        () {
      super.isProductTypeLoading = value;
    });
  }

  late final _$allProductsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.allProducts', context: context);

  @override
  List<SelectEntity> get allProducts {
    _$allProductsAtom.reportRead();
    return super.allProducts;
  }

  @override
  set allProducts(List<SelectEntity> value) {
    _$allProductsAtom.reportWrite(value, super.allProducts, () {
      super.allProducts = value;
    });
  }

  late final _$productTypesListToSelectAtom = Atom(
      name: 'ItemSelectionControllerAbstract.productTypesListToSelect',
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
      name: 'ItemSelectionControllerAbstract.filteredProductTypeListToSelect',
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

  late final _$requestedProductItemsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.requestedProductItems',
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
      name: 'ItemSelectionControllerAbstract.finalRequestedProducts',
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

  late final _$isCompanyLoadingAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isCompanyLoading',
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

  late final _$companiesListToSelectAtom = Atom(
      name: 'ItemSelectionControllerAbstract.companiesListToSelect',
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

  late final _$allCompaniesToSelectAtom = Atom(
      name: 'ItemSelectionControllerAbstract.allCompaniesToSelect',
      context: context);

  @override
  List<SelectEntity> get allCompaniesToSelect {
    _$allCompaniesToSelectAtom.reportRead();
    return super.allCompaniesToSelect;
  }

  @override
  set allCompaniesToSelect(List<SelectEntity> value) {
    _$allCompaniesToSelectAtom.reportWrite(value, super.allCompaniesToSelect,
        () {
      super.allCompaniesToSelect = value;
    });
  }

  late final _$companiesListAtom = Atom(
      name: 'ItemSelectionControllerAbstract.companiesList', context: context);

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
      name: 'ItemSelectionControllerAbstract.companySegmentsListToSelect',
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
          'ItemSelectionControllerAbstract.filteredCompanySegmentsListToSelect',
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

  late final _$selectedCompanyIdsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.selectedCompanyIds',
      context: context);

  @override
  Set<int> get selectedCompanyIds {
    _$selectedCompanyIdsAtom.reportRead();
    return super.selectedCompanyIds;
  }

  @override
  set selectedCompanyIds(Set<int> value) {
    _$selectedCompanyIdsAtom.reportWrite(value, super.selectedCompanyIds, () {
      super.selectedCompanyIds = value;
    });
  }

  late final _$cityFilterTextAtom = Atom(
      name: 'ItemSelectionControllerAbstract.cityFilterText', context: context);

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
      name: 'ItemSelectionControllerAbstract.stateFilterText',
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

  late final _$companySegmentNamesAtom = Atom(
      name: 'ItemSelectionControllerAbstract.companySegmentNames',
      context: context);

  @override
  Map<int, String> get companySegmentNames {
    _$companySegmentNamesAtom.reportRead();
    return super.companySegmentNames;
  }

  @override
  set companySegmentNames(Map<int, String> value) {
    _$companySegmentNamesAtom.reportWrite(value, super.companySegmentNames, () {
      super.companySegmentNames = value;
    });
  }

  late final _$finalRequestedCompaniesAtom = Atom(
      name: 'ItemSelectionControllerAbstract.finalRequestedCompanies',
      context: context);

  @override
  List<SelectEntity> get finalRequestedCompanies {
    _$finalRequestedCompaniesAtom.reportRead();
    return super.finalRequestedCompanies;
  }

  @override
  set finalRequestedCompanies(List<SelectEntity> value) {
    _$finalRequestedCompaniesAtom
        .reportWrite(value, super.finalRequestedCompanies, () {
      super.finalRequestedCompanies = value;
    });
  }

  late final _$isAgriculturalInputLoadingAtom = Atom(
      name: 'ItemSelectionControllerAbstract.isAgriculturalInputLoading',
      context: context);

  @override
  bool get isAgriculturalInputLoading {
    _$isAgriculturalInputLoadingAtom.reportRead();
    return super.isAgriculturalInputLoading;
  }

  @override
  set isAgriculturalInputLoading(bool value) {
    _$isAgriculturalInputLoadingAtom
        .reportWrite(value, super.isAgriculturalInputLoading, () {
      super.isAgriculturalInputLoading = value;
    });
  }

  late final _$agriculturalInputListToSelectAtom = Atom(
      name: 'ItemSelectionControllerAbstract.agriculturalInputListToSelect',
      context: context);

  @override
  List<SelectEntity> get agriculturalInputListToSelect {
    _$agriculturalInputListToSelectAtom.reportRead();
    return super.agriculturalInputListToSelect;
  }

  @override
  set agriculturalInputListToSelect(List<SelectEntity> value) {
    _$agriculturalInputListToSelectAtom
        .reportWrite(value, super.agriculturalInputListToSelect, () {
      super.agriculturalInputListToSelect = value;
    });
  }

  late final _$agriculturalInputClassesListToSelectAtom = Atom(
      name:
          'ItemSelectionControllerAbstract.agriculturalInputClassesListToSelect',
      context: context);

  @override
  List<SelectEntity> get agriculturalInputClassesListToSelect {
    _$agriculturalInputClassesListToSelectAtom.reportRead();
    return super.agriculturalInputClassesListToSelect;
  }

  @override
  set agriculturalInputClassesListToSelect(List<SelectEntity> value) {
    _$agriculturalInputClassesListToSelectAtom
        .reportWrite(value, super.agriculturalInputClassesListToSelect, () {
      super.agriculturalInputClassesListToSelect = value;
    });
  }

  late final _$filteredAgriculturalInputClassesListToSelectAtom = Atom(
      name:
          'ItemSelectionControllerAbstract.filteredAgriculturalInputClassesListToSelect',
      context: context);

  @override
  List<SelectEntity> get filteredAgriculturalInputClassesListToSelect {
    _$filteredAgriculturalInputClassesListToSelectAtom.reportRead();
    return super.filteredAgriculturalInputClassesListToSelect;
  }

  @override
  set filteredAgriculturalInputClassesListToSelect(List<SelectEntity> value) {
    _$filteredAgriculturalInputClassesListToSelectAtom.reportWrite(
        value, super.filteredAgriculturalInputClassesListToSelect, () {
      super.filteredAgriculturalInputClassesListToSelect = value;
    });
  }

  late final _$requestedAgriculturalInputItemsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.requestedAgriculturalInputItems',
      context: context);

  @override
  List<ItemsEntity> get requestedAgriculturalInputItems {
    _$requestedAgriculturalInputItemsAtom.reportRead();
    return super.requestedAgriculturalInputItems;
  }

  @override
  set requestedAgriculturalInputItems(List<ItemsEntity> value) {
    _$requestedAgriculturalInputItemsAtom
        .reportWrite(value, super.requestedAgriculturalInputItems, () {
      super.requestedAgriculturalInputItems = value;
    });
  }

  late final _$finalRequestedAgriculturalInputsAtom = Atom(
      name: 'ItemSelectionControllerAbstract.finalRequestedAgriculturalInputs',
      context: context);

  @override
  List<ItemsEntity> get finalRequestedAgriculturalInputs {
    _$finalRequestedAgriculturalInputsAtom.reportRead();
    return super.finalRequestedAgriculturalInputs;
  }

  @override
  set finalRequestedAgriculturalInputs(List<ItemsEntity> value) {
    _$finalRequestedAgriculturalInputsAtom
        .reportWrite(value, super.finalRequestedAgriculturalInputs, () {
      super.finalRequestedAgriculturalInputs = value;
    });
  }

  late final _$loadItemsAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.loadItems',
      context: context);

  @override
  Future<void> loadItems(ItemType type) {
    return _$loadItemsAsyncAction.run(() => super.loadItems(type));
  }

  late final _$getAllProductsToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllProductsToSelect',
      context: context);

  @override
  Future<void> getAllProductsToSelect() {
    return _$getAllProductsToSelectAsyncAction
        .run(() => super.getAllProductsToSelect());
  }

  late final _$getAllProductTypesToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllProductTypesToSelect',
      context: context);

  @override
  Future<void> getAllProductTypesToSelect() {
    return _$getAllProductTypesToSelectAsyncAction
        .run(() => super.getAllProductTypesToSelect());
  }

  late final _$applyProductFiltersAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.applyProductFilters',
      context: context);

  @override
  Future<void> applyProductFilters() {
    return _$applyProductFiltersAsyncAction
        .run(() => super.applyProductFilters());
  }

  late final _$getAllCompaniesAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllCompanies',
      context: context);

  @override
  Future<void> getAllCompanies() {
    return _$getAllCompaniesAsyncAction.run(() => super.getAllCompanies());
  }

  late final _$getAllCompaniesToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllCompaniesToSelect',
      context: context);

  @override
  Future<void> getAllCompaniesToSelect() {
    return _$getAllCompaniesToSelectAsyncAction
        .run(() => super.getAllCompaniesToSelect());
  }

  late final _$getAllCompanySegmentsToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllCompanySegmentsToSelect',
      context: context);

  @override
  Future<void> getAllCompanySegmentsToSelect() {
    return _$getAllCompanySegmentsToSelectAsyncAction
        .run(() => super.getAllCompanySegmentsToSelect());
  }

  late final _$applyCompanyFiltersAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.applyCompanyFilters',
      context: context);

  @override
  Future<void> applyCompanyFilters() {
    return _$applyCompanyFiltersAsyncAction
        .run(() => super.applyCompanyFilters());
  }

  late final _$getAllAgriculturalInputsToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllAgriculturalInputsToSelect',
      context: context);

  @override
  Future<void> getAllAgriculturalInputsToSelect() {
    return _$getAllAgriculturalInputsToSelectAsyncAction
        .run(() => super.getAllAgriculturalInputsToSelect());
  }

  late final _$getAllAgriculturalInputClassesToSelectAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.getAllAgriculturalInputClassesToSelect',
      context: context);

  @override
  Future<void> getAllAgriculturalInputClassesToSelect() {
    return _$getAllAgriculturalInputClassesToSelectAsyncAction
        .run(() => super.getAllAgriculturalInputClassesToSelect());
  }

  late final _$applyAgriculturalFiltersAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.applyAgriculturalFilters',
      context: context);

  @override
  Future<void> applyAgriculturalFilters() {
    return _$applyAgriculturalFiltersAsyncAction
        .run(() => super.applyAgriculturalFilters());
  }

  late final _$loadInitialAgriculturalInputsAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.loadInitialAgriculturalInputs',
      context: context);

  @override
  Future<void> loadInitialAgriculturalInputs({bool isSearch = false}) {
    return _$loadInitialAgriculturalInputsAsyncAction
        .run(() => super.loadInitialAgriculturalInputs(isSearch: isSearch));
  }

  late final _$loadMoreAgriculturalInputsAsyncAction = AsyncAction(
      'ItemSelectionControllerAbstract.loadMoreAgriculturalInputs',
      context: context);

  @override
  Future<void> loadMoreAgriculturalInputs() {
    return _$loadMoreAgriculturalInputsAsyncAction
        .run(() => super.loadMoreAgriculturalInputs());
  }

  late final _$ItemSelectionControllerAbstractActionController =
      ActionController(
          name: 'ItemSelectionControllerAbstract', context: context);

  @override
  void agriculturalInputScrollListener() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.agriculturalInputScrollListener');
    try {
      return super.agriculturalInputScrollListener();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchQuery(String query) {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.updateSearchQuery');
    try {
      return super.updateSearchQuery(query);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectionState() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.resetSelectionState');
    try {
      return super.resetSelectionState();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementRequestedProductQuantity(int productId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.incrementRequestedProductQuantity');
    try {
      return super.incrementRequestedProductQuantity(productId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementRequestedProductQuantity(int productId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.decrementRequestedProductQuantity');
    try {
      return super.decrementRequestedProductQuantity(productId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRequestedProduct(int productId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.removeRequestedProduct');
    try {
      return super.removeRequestedProduct(productId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalRequestedProducts() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.updateFinalRequestedProducts');
    try {
      return super.updateFinalRequestedProducts();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedProductTypes(Set<int> selectedIds) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.updateSelectedProductTypes');
    try {
      return super.updateSelectedProductTypes(selectedIds);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedProductTypes() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.clearSelectedProductTypes');
    try {
      return super.clearSelectedProductTypes();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCompanySelection(int companyId, bool isSelected) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.toggleCompanySelection');
    try {
      return super.toggleCompanySelection(companyId, isSelected);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isCompanySelected(int companyId) {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.isCompanySelected');
    try {
      return super.isCompanySelected(companyId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedCompany(int companyId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.removeSelectedCompany');
    try {
      return super.removeSelectedCompany(companyId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalRequestedCompanies() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.updateFinalRequestedCompanies');
    try {
      return super.updateFinalRequestedCompanies();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCityFilter(String city) {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.updateCityFilter');
    try {
      return super.updateCityFilter(city);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateStateFilter(String state) {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.updateStateFilter');
    try {
      return super.updateStateFilter(state);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedCompanySegments() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.clearSelectedCompanySegments');
    try {
      return super.clearSelectedCompanySegments();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedCompanySegments(Set<int> selectedIds) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.updateSelectedCompanySegments');
    try {
      return super.updateSelectedCompanySegments(selectedIds);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedCityFilter() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name: 'ItemSelectionControllerAbstract.clearSelectedCityFilter');
    try {
      return super.clearSelectedCityFilter();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> getUniqueStates() {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.getUniqueStates');
    try {
      return super.getUniqueStates();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> getUniqueCities({String? state}) {
    final _$actionInfo = _$ItemSelectionControllerAbstractActionController
        .startAction(name: 'ItemSelectionControllerAbstract.getUniqueCities');
    try {
      return super.getUniqueCities(state: state);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementRequestedAgriculturalInputQuantity(int agriculturalInputId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.incrementRequestedAgriculturalInputQuantity');
    try {
      return super
          .incrementRequestedAgriculturalInputQuantity(agriculturalInputId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementRequestedAgriculturalInputQuantity(int agriculturalInputId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.decrementRequestedAgriculturalInputQuantity');
    try {
      return super
          .decrementRequestedAgriculturalInputQuantity(agriculturalInputId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRequestedAgriculturalInput(int agriculturalInputId) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.removeRequestedAgriculturalInput');
    try {
      return super.removeRequestedAgriculturalInput(agriculturalInputId);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFinalRequestedAgriculturalInput() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.updateFinalRequestedAgriculturalInput');
    try {
      return super.updateFinalRequestedAgriculturalInput();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedAgriculturalInputClasses(Set<int> selectedIds) {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.updateSelectedAgriculturalInputClasses');
    try {
      return super.updateSelectedAgriculturalInputClasses(selectedIds);
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedAgriculturalInputClasses() {
    final _$actionInfo =
        _$ItemSelectionControllerAbstractActionController.startAction(
            name:
                'ItemSelectionControllerAbstract.clearSelectedAgriculturalInputClasses');
    try {
      return super.clearSelectedAgriculturalInputClasses();
    } finally {
      _$ItemSelectionControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
agriculturalInputCurrentPage: ${agriculturalInputCurrentPage},
isAgriculturalInputLoadingMore: ${isAgriculturalInputLoadingMore},
hasMoreAgriculturalInputs: ${hasMoreAgriculturalInputs},
isFirstLoading: ${isFirstLoading},
currentLoadedItemType: ${currentLoadedItemType},
searchQuery: ${searchQuery},
isProductLoading: ${isProductLoading},
isProductTypeLoading: ${isProductTypeLoading},
allProducts: ${allProducts},
productTypesListToSelect: ${productTypesListToSelect},
filteredProductTypeListToSelect: ${filteredProductTypeListToSelect},
requestedProductItems: ${requestedProductItems},
finalRequestedProducts: ${finalRequestedProducts},
isCompanyLoading: ${isCompanyLoading},
companiesListToSelect: ${companiesListToSelect},
allCompaniesToSelect: ${allCompaniesToSelect},
companiesList: ${companiesList},
companySegmentsListToSelect: ${companySegmentsListToSelect},
filteredCompanySegmentsListToSelect: ${filteredCompanySegmentsListToSelect},
selectedCompanyIds: ${selectedCompanyIds},
cityFilterText: ${cityFilterText},
stateFilterText: ${stateFilterText},
companySegmentNames: ${companySegmentNames},
finalRequestedCompanies: ${finalRequestedCompanies},
isAgriculturalInputLoading: ${isAgriculturalInputLoading},
agriculturalInputListToSelect: ${agriculturalInputListToSelect},
agriculturalInputClassesListToSelect: ${agriculturalInputClassesListToSelect},
filteredAgriculturalInputClassesListToSelect: ${filteredAgriculturalInputClassesListToSelect},
requestedAgriculturalInputItems: ${requestedAgriculturalInputItems},
finalRequestedAgriculturalInputs: ${finalRequestedAgriculturalInputs},
filteredAddItemsList: ${filteredAddItemsList}
    ''';
  }
}
