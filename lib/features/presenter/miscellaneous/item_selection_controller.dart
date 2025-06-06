import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_input_usecases/agricultural_input_class_usecases/get_all_agricultural_input_classes_to_select_usecases/get_all_agricultural_input_classes_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/agricultural_input_usecases/get_all_agricultural_inputs_to_select_usecases/get_all_agricultural_inputs_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_to_select_usecase/get_all_products_to_select_usecase.dart';

import '../../../core/usecase/usecase.dart';
import '../../domain/entities/items_entities/items_entity.dart';
import '../../domain/entities/select_entities/select_entity.dart';
import '../../domain/params/arg_params/arg_params.dart';
import '../../domain/usecases/agricultural_input_usecases/get_all_agricultural_inputs_by_class_id_to_select_usecases/get_all_agricultural_inputs_by_class_id_to_select_usecase.dart';
import '../../domain/usecases/company_usecases/company_segment_usecases/get_all_company_segments_to_select_usecases/get_all_company_segments_to_select_usecases.dart';
import '../../domain/usecases/company_usecases/get_all_companies_to_select_usecase/get_all_companies_to_select_usecase.dart';
import '../../domain/usecases/company_usecases/get_all_companies_usecase/get_all_companies_usecase.dart';
import '../../domain/usecases/product_usecases/get_all_products_by_type_id_to_select_usecases/get_all_products_by_type_id_to_select_usecase.dart';
import '../../domain/usecases/product_usecases/product_types_usecases/get_all_product_types_to_select_usecases/get_all_product_types_to_select_usecase.dart';

part 'item_selection_controller.g.dart';

enum ItemType { product, company, agriculturalInput }

class ItemSelectionController = ItemSelectionControllerAbstract
    with _$ItemSelectionController;

abstract class ItemSelectionControllerAbstract with Store {
  @observable
  bool isFirstLoading = false;
  @observable
  ItemType? currentLoadedItemType;
  @observable
  String searchQuery = '';

  // Observáveis e listas de produtos
  @observable
  bool isProductLoading = false;
  @observable
  bool isProductTypeLoading = false;
  List<SelectEntity> productListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> allProducts = [];
  @observable
  List<SelectEntity> productTypesListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> filteredProductTypeListToSelect = ObservableList<SelectEntity>();
  @observable
  List<ItemsEntity> requestedProductItems = ObservableList<ItemsEntity>();
  @observable
  List<ItemsEntity> finalRequestedProducts = ObservableList<ItemsEntity>();

  // Observáveis e listas de Empresas
  @observable
  bool isCompanyLoading = false;
  @observable
  List<SelectEntity> companiesListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> allCompaniesToSelect = [];
  @observable
  List<CompanyEntity> companiesList = ObservableList<CompanyEntity>();
  @observable
  List<SelectEntity> companySegmentsListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> filteredCompanySegmentsListToSelect = ObservableList<SelectEntity>();
  @observable
  Set<int> selectedCompanyIds = ObservableSet<int>();
  @observable
  String cityFilterText = '';
  @observable
  String stateFilterText = '';
  @observable
  Map<int, String> companySegmentNames = ObservableMap<int, String>();
  @observable
  List<SelectEntity> finalRequestedCompanies = ObservableList<SelectEntity>();

  //Observáveis e lista de insumos
  @observable
  bool isAgriculturalInputLoading = false;
  @observable
  List<SelectEntity> agriculturalInputListToSelect = ObservableList<SelectEntity>();
  List<SelectEntity> allAgriculturalInputs = [];
  @observable
  List<SelectEntity> agriculturalInputClassesListToSelect =
  ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> filteredAgriculturalInputClassesListToSelect =
  ObservableList<SelectEntity>();
  @observable
  List<ItemsEntity> requestedAgriculturalInputItems = ObservableList<ItemsEntity>();
  @observable
  List<ItemsEntity> finalRequestedAgriculturalInputs = ObservableList<ItemsEntity>();

  @computed
  List get filteredAddItemsList {
    if (currentLoadedItemType == null) {
      return [];
    }

    List baseList;
    if (currentLoadedItemType == ItemType.product) {
      baseList = requestedProductItems;
    } else if (currentLoadedItemType == ItemType.company) {
      baseList = companiesListToSelect;
    } else {
      baseList = requestedAgriculturalInputItems;
    }

    if (searchQuery.isEmpty) {
      return baseList;
    } else {
      return baseList.where((item) {
        if (currentLoadedItemType == ItemType.product ||
            currentLoadedItemType == ItemType.agriculturalInput) {
          final itemWithQuantity = item as ItemsEntity;
          return itemWithQuantity.productName != null &&
              itemWithQuantity.productName!
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase());
        } else {
          // ItemType.company
          final companyItem = item as SelectEntity;
          return companyItem.label != null &&
              companyItem.label!.toLowerCase().contains(searchQuery.toLowerCase());
        }
      }).toList();
    }
  }

  @action
  void updateSearchQuery(String query) => searchQuery = query;

  @action
  Future<void> loadItems(ItemType type) async {
    isFirstLoading = true;
    isProductLoading = false;
    isCompanyLoading = false;
    isAgriculturalInputLoading = false;
    currentLoadedItemType = type;
    searchQuery = '';

    if (type == ItemType.product) {
      isProductLoading = true;
      await getAllProductsToSelect();
      await getAllProductTypesToSelect();
      isProductLoading = false;
    } else if (type == ItemType.company) {
      isCompanyLoading = true;
      await getAllCompanies();
      await getAllCompaniesToSelect();
      await getAllCompanySegmentsToSelect();
      isCompanyLoading = false;
    } else if (type == ItemType.agriculturalInput) {
      isAgriculturalInputLoading = true;
      await getAllAgriculturalInputsToSelect();
      await getAllAgriculturalInputClassesToSelect();
      isAgriculturalInputLoading = false;
    }
    isFirstLoading = false;
  }

  @action
  void resetSelectionState() {
    searchQuery = '';
    currentLoadedItemType = null;

    // Limpar estados de produtos
    isProductLoading = false;
    productListToSelect.clear();
    allProducts.clear();
    productTypesListToSelect.clear();
    filteredProductTypeListToSelect.clear();
    requestedProductItems.clear();
    finalRequestedProducts.clear();

    // Limpar estados de empresas
    isCompanyLoading = false;
    companiesListToSelect.clear();
    allCompaniesToSelect.clear();
    companiesList.clear();
    companySegmentsListToSelect.clear();
    filteredCompanySegmentsListToSelect.clear();
    selectedCompanyIds.clear();
    cityFilterText = '';
    stateFilterText = '';
    companySegmentNames.clear();
    finalRequestedCompanies.clear();

    // Limpar estados de insumos
    isAgriculturalInputLoading = false;
    agriculturalInputListToSelect.clear();
    allAgriculturalInputs.clear();
    agriculturalInputClassesListToSelect.clear();
    filteredAgriculturalInputClassesListToSelect.clear();
    requestedAgriculturalInputItems.clear();
    finalRequestedAgriculturalInputs.clear();
  }

  //Actions de produtos
  @action
  Future<void> getAllProductsToSelect() async {
    isProductLoading = true;

    final getAllProductsToSelect = Modular.get<GetAllProductsToSelectUsecase>();
    final result = await getAllProductsToSelect(NoParams());
    result.fold(
          (error) => error.friendlyMessage,
          (success) {
        allProducts = success;
        productListToSelect = ObservableList<SelectEntity>.of(success);
        requestedProductItems.clear();
        requestedProductItems.addAll(allProducts.map((selectEntity) =>
            ItemsEntity(
              productId: selectEntity.value,
              productName: selectEntity.label,
              requestedQuantity: 0,
            )));
      },
    );
    isProductLoading = false;
  }

  @action
  Future<void> getAllProductTypesToSelect() async {
    isProductTypeLoading = true;
    final getAllProductTypesToSelect = Modular.get<GetAllProductTypesToSelectUsecase>();
    final result = await getAllProductTypesToSelect(NoParams());

    result.fold(
          (error) => debugPrint('Error loading product types: ${error.friendlyMessage}'),
          (success) =>
      productTypesListToSelect = ObservableList<SelectEntity>.of(success),
    );
    isProductTypeLoading = false;
  }

  @action
  void incrementRequestedProductQuantity(int productId) {
    final index = requestedProductItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      final currentItem = requestedProductItems[index];
      final updatedItem =
      currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity + 1);
      requestedProductItems[index] = updatedItem;
      updateFinalRequestedProducts();
    }
  }

  @action
  void decrementRequestedProductQuantity(int productId) {
    final index = requestedProductItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      final currentItem = requestedProductItems[index];
      if (currentItem.requestedQuantity > 0) {
        final updatedItem =
        currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity - 1);
        requestedProductItems[index] = updatedItem;
        updateFinalRequestedProducts();
      }
    }
  }

  @action
  void removeRequestedProduct(int productId) {
    requestedProductItems.removeWhere((item) => item.productId == productId);
    updateFinalRequestedProducts();
  }

  @action
  void updateFinalRequestedProducts() {
    finalRequestedProducts = ObservableList<ItemsEntity>.of(
        requestedProductItems.where((item) => item.requestedQuantity > 0).toList());
  }

  @action
  void updateSelectedProductTypes(Set<int> selectedIds) {
    filteredProductTypeListToSelect.clear();
    for (var id in selectedIds) {
      final type = productTypesListToSelect.firstWhere((element) => element.value == id);
      filteredProductTypeListToSelect.add(type);
    }
    applyProductFilters();
  }

  @action
  void clearSelectedProductTypes() {
    filteredProductTypeListToSelect.clear();
    applyProductFilters();
  }

  @action
  Future<void> applyProductFilters() async {
    isProductLoading = true;
    if (filteredProductTypeListToSelect.isEmpty) {
      final currentRequestedQuantities = Map.fromEntries(requestedProductItems
          .map((item) => MapEntry(item.productId, item.requestedQuantity)));

      requestedProductItems.clear();
      productListToSelect.clear();

      requestedProductItems.addAll(allProducts.map((selectEntity) =>
          ItemsEntity(
            productId: selectEntity.value,
            productName: selectEntity.label,
            requestedQuantity: currentRequestedQuantities[selectEntity.value] ?? 0,
          )));
      productListToSelect.addAll(allProducts);
      isProductLoading = false;
      return;
    }

    final getAllProductsByTypeIdToSelectUsecase =
    Modular.get<GetAllProductsByTypeIdToSelectUsecase>();
    final result = await getAllProductsByTypeIdToSelectUsecase(ArgParams(
        firstArgs: filteredProductTypeListToSelect.map((e) => e.value).toList()));
    result
        .fold((error) => debugPrint('Error filtering products: ${error.friendlyMessage}'),
            (success) {
          final currentRequestedQuantities = Map.fromEntries(requestedProductItems
              .map((item) => MapEntry(item.productId, item.requestedQuantity)));
          requestedProductItems.clear();
          productListToSelect.clear();
          requestedProductItems.addAll(success.map((selectEntity) =>
              ItemsEntity(
                productId: selectEntity.value,
                productName: selectEntity.label,
                requestedQuantity: currentRequestedQuantities[selectEntity.value] ?? 0,
              )));
          productListToSelect = ObservableList<SelectEntity>.of(success);
        });
    isProductLoading = false;
  }

//Actions de Empresas
  @action
  Future<void> getAllCompanies() async {
    isCompanyLoading = true;
    final getAllCompanies = Modular.get<GetAllCompaniesUsecase>();
    final result = await getAllCompanies(NoParams());

    result.fold(
          (error) => debugPrint('Error loading companies: ${error.friendlyMessage}'),
          (success) => companiesList = ObservableList<CompanyEntity>.of(success),
    );
    isCompanyLoading = false;
  }

  @action
  Future<void> getAllCompaniesToSelect() async {
    isCompanyLoading = true;

    final getAllCompaniesToSelect = Modular.get<GetAllCompaniesToSelectUsecase>();
    final result = await getAllCompaniesToSelect(NoParams());

    result.fold(
          (error) =>
          debugPrint('Error loading companies for select: ${error.friendlyMessage}'),
          (success) {
        allCompaniesToSelect = success;
        companiesListToSelect = ObservableList<SelectEntity>.of(success);
      },
    );
    isCompanyLoading = false;

    companiesListToSelect = ObservableList<SelectEntity>.of(allCompaniesToSelect);

    for (var element in finalRequestedCompanies) {
      if (!selectedCompanyIds.contains(element.value)) {
        selectedCompanyIds.add(element.value);
      }
    }
    applyCompanyFilters();
  }

  @action
  Future<void> getAllCompanySegmentsToSelect() async {
    isCompanyLoading = true;

    final getAllCompanySegmentsToSelectUsecase =
    Modular.get<GetAllCompanySegmentsToSelectUsecase>();
    final result = await getAllCompanySegmentsToSelectUsecase(ArgParams());

    result.fold(
            (error) =>
            debugPrint('Error loading company segments: ${error.friendlyMessage}'),
            (success) {
          companySegmentsListToSelect = ObservableList<SelectEntity>.of(success);
          companySegmentNames = ObservableMap.of(
              Map.fromEntries(success.map((e) => MapEntry(e.value, e.label ?? ''))));
        });
    isCompanyLoading = false;
  }

  @action
  void toggleCompanySelection(int companyId, bool isSelected) {
    if (isSelected) {
      selectedCompanyIds.add(companyId);
    } else {
      selectedCompanyIds.remove(companyId);
    }
    updateFinalRequestedCompanies();
  }

  @action
  bool isCompanySelected(int companyId) => selectedCompanyIds.contains(companyId);

  @action
  void removeSelectedCompany(int companyId) {
    selectedCompanyIds.remove(companyId);
    updateFinalRequestedCompanies();
  }

  @action
  void updateFinalRequestedCompanies() {
    finalRequestedCompanies.clear();
    for (var id in selectedCompanyIds) {
      final company = allCompaniesToSelect.firstWhere((element) => element.value == id);
      finalRequestedCompanies.add(company);
    }
  }

  CompanyEntity? getCompanyDetails(int companyId) {
    return companiesList.firstWhere((company) => company.id == companyId,
        orElse: () => CompanyEntity(id: -1));
  }

  String getCompanySegmentName(int segmentId) {
    return companySegmentNames[segmentId] ?? 'N/A';
  }

  @action
  void updateCityFilter(String city) => cityFilterText = city;

  @action
  void updateStateFilter(String state) => stateFilterText = state;

  @action
  void clearSelectedCompanySegments() {
    filteredCompanySegmentsListToSelect.clear();
    applyCompanyFilters();
  }

  @action
  void updateSelectedCompanySegments(Set<int> selectedIds) {
    filteredCompanySegmentsListToSelect.clear();
    for (var id in selectedIds) {
      final segment =
      companySegmentsListToSelect.firstWhere((element) => element.value == id);
      filteredCompanySegmentsListToSelect.add(segment);
    }
    applyCompanyFilters();
  }

  @action
  void clearSelectedCityFilter() {
    cityFilterText = '';
    stateFilterText = '';
    applyCompanyFilters();
  }

  @action
  List<String> getUniqueStates() {
    return companiesList.map((c) => c.addressState).whereType<String>().toSet().toList();
  }

  @action
  List<String> getUniqueCities({String? state}) {
    List<String> cities = companiesList
        .where((c) => state == null || state.isEmpty || c.addressState == state)
        .map((c) => c.addressCity)
        .whereType<String>()
        .toSet()
        .toList();
    return cities;
  }

  @action
  Future<void> applyCompanyFilters() async {
    isCompanyLoading = true;

    final bool hasSegmentFilter = filteredCompanySegmentsListToSelect.isNotEmpty;
    final bool hasCityFilter = cityFilterText.isNotEmpty;
    final bool hasStateFilter = stateFilterText.isNotEmpty;

    List<SelectEntity> filteredCompaniesSelectEntity = [];

    filteredCompaniesSelectEntity = allCompaniesToSelect.where((companySelect) {
      final CompanyEntity? companyDetails = getCompanyDetails(companySelect.value);

      if (companyDetails == null) {
        return false;
      }
      bool matchesSegment = true;
      if (hasSegmentFilter) {
        matchesSegment = companyDetails.segments != null &&
            companyDetails.segments!.any((segment) =>
                filteredCompanySegmentsListToSelect
                    .any((filterSegment) => filterSegment.value == segment.id));
      }
      bool matchesCity = true;
      if (hasCityFilter) {
        matchesCity = companyDetails.addressCity != null &&
            companyDetails.addressCity!
                .toLowerCase()
                .contains(cityFilterText.toLowerCase());
      }
      bool matchesState = true;
      if (hasStateFilter) {
        matchesState = companyDetails.addressState != null &&
            companyDetails.addressState!
                .toLowerCase()
                .contains(stateFilterText.toLowerCase());
      }
      return matchesSegment && matchesCity && matchesState;
    }).toList();

    companiesListToSelect =
    ObservableList<SelectEntity>.of(filteredCompaniesSelectEntity);

    isCompanyLoading = false;
  }

  @action
  Future<void> getAllAgriculturalInputsToSelect() async {
    final getAllAgriculturalInputsToSelect =
    Modular.get<GetAllAgriculturalInputsToSelectUsecase>();
    final result = await getAllAgriculturalInputsToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      allAgriculturalInputs = success;
      agriculturalInputListToSelect = ObservableList<SelectEntity>.of(success);
      requestedAgriculturalInputItems.clear();
      requestedAgriculturalInputItems
          .addAll(allAgriculturalInputs.map((selectEntity) =>
          ItemsEntity(
            productId: selectEntity.value,
            productName: selectEntity.label,
            requestedQuantity: 0,
          )));
      return success;
    });
  }

  @action
  Future<void> getAllAgriculturalInputClassesToSelect() async {
    final getAllAgriculturalInputClassesToSelectUsecase =
    Modular.get<GetAllAgriculturalInputClassesToSelectUsecase>();
    final result = await getAllAgriculturalInputClassesToSelectUsecase(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      agriculturalInputClassesListToSelect = success;
      return success;
    });
  }

  @action
  void incrementRequestedAgriculturalInputQuantity(int agriculturalInputId) {
    final index =
    requestedAgriculturalInputItems.indexWhere((item) =>
    item.productId == agriculturalInputId);
    if (index != -1) {
      final currentItem = requestedAgriculturalInputItems[index];
      final updatedItem =
      currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity + 1);
      requestedAgriculturalInputItems[index] = updatedItem;
      updateFinalRequestedAgriculturalInput();
    }
  }

  @action
  void decrementRequestedAgriculturalInputQuantity(int agriculturalInputId) {
    final index =
    requestedAgriculturalInputItems.indexWhere((item) =>
    item.productId == agriculturalInputId);
    if (index != -1) {
      final currentItem = requestedAgriculturalInputItems[index];
      if (currentItem.requestedQuantity > 0) {
        final updatedItem =
        currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity - 1);
        requestedAgriculturalInputItems[index] = updatedItem;
        updateFinalRequestedAgriculturalInput();
      }
    }
  }

  @action
  void removeRequestedAgriculturalInput(int agriculturalInputId) {
    requestedAgriculturalInputItems.removeWhere((item) =>
    item.productId == agriculturalInputId);
    updateFinalRequestedAgriculturalInput();
  }

  @action
  void updateFinalRequestedAgriculturalInput() {
    finalRequestedAgriculturalInputs = ObservableList<ItemsEntity>.of(
        requestedAgriculturalInputItems
            .where((item) => item.requestedQuantity > 0)
            .toList());
  }

  @action
  void updateSelectedAgriculturalInputClasses(Set<int> selectedIds) {
    filteredAgriculturalInputClassesListToSelect.clear();
    for (var id in selectedIds) {
      final type = agriculturalInputClassesListToSelect
          .firstWhere((element) => element.value == id);
      filteredAgriculturalInputClassesListToSelect.add(type);
    }
    applyAgriculturalFilters();
  }

  @action
  void clearSelectedAgriculturalInputClasses() {
    filteredAgriculturalInputClassesListToSelect.clear();
    applyAgriculturalFilters();
  }

  @action
  Future<void> applyAgriculturalFilters() async {
    isAgriculturalInputLoading = true;
    if (filteredAgriculturalInputClassesListToSelect.isEmpty) {
      final currentRequestedQuantities = Map.fromEntries(requestedAgriculturalInputItems
          .map((item) => MapEntry(item.productId, item.requestedQuantity)));
      requestedAgriculturalInputItems.clear();
      agriculturalInputListToSelect.clear();
      requestedAgriculturalInputItems
          .addAll(allAgriculturalInputs.map((selectEntity) =>
          ItemsEntity(
            productId: selectEntity.value,
            productName: selectEntity.label,
            requestedQuantity: currentRequestedQuantities[selectEntity.value] ?? 0,
          )));
      agriculturalInputListToSelect.addAll(allAgriculturalInputs);
      isAgriculturalInputLoading = false;
      return;
    }

    final getAllAgriculturalInputsByClassIdToSelectUsecase = Modular.get<
        GetAllAgriculturalInputsByClassIdToSelectUsecase>();
    final result = await getAllAgriculturalInputsByClassIdToSelectUsecase(ArgParams(
        firstArgs: filteredAgriculturalInputClassesListToSelect
            .map((e) => e.value)
            .toList()));

    result.fold(
          (error) => debugPrint('Error filtering agricultural inputs: ${error.friendlyMessage}'),
          (success) {
        final currentRequestedQuantities = Map.fromEntries(
            requestedAgriculturalInputItems.map((item) =>
                MapEntry(item.productId, item.requestedQuantity)));

        requestedAgriculturalInputItems.clear();
        agriculturalInputListToSelect.clear();

        requestedAgriculturalInputItems.addAll(success.map((selectEntity) => ItemsEntity(
          productId: selectEntity.value,
          productName: selectEntity.label,
          requestedQuantity: currentRequestedQuantities[selectEntity.value] ?? 0,
        )));
        agriculturalInputListToSelect = ObservableList<SelectEntity>.of(success);
      },
    );

    isAgriculturalInputLoading = false;
  }
}
