import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_ezagro_flutter/core/utils/datetime_formatter.dart';
import 'package:new_ezagro_flutter/features/domain/entities/company_entities/company_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/items_entities/items_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/purchase_request_entities/send_purchase_request_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/get_all_companies_usecase/get_all_companies_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/get_all_cost_centers_to_select_usecases/get_all_cost_centers_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/employee_usecase/get_all_employees_by_farm_id_to_select_usecases/get_all_employees_by_farm_id_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_by_type_id_to_select_usecases/get_all_products_by_type_id_to_select_usecase.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/purchase_request_usecases/purchase_request_delivery_location_usecases/get_all_purchase_request_delivery_locations_to_select_usecases/get_all_purchase_request_delivery_locations_to_select_usecase.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../../domain/usecases/company_usecases/company_segment_usecases/get_all_company_segments_to_select_usecases/get_all_company_segments_to_select_usecases.dart';
import '../../../../domain/usecases/company_usecases/get_all_companies_to_select_usecase/get_all_companies_to_select_usecase.dart';



import '../../../../domain/usecases/cost_center_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecases/get_all_cost_centers_by_cost_center_type_id_to_select_usecase.dart';
import '../../../../domain/usecases/farm_usecases/get_all_farms_by_cost_center_id_to_select_usecases/get_all_farms_by_cost_center_id_to_select_usecase.dart';
import '../../../../domain/usecases/payment_method_usecases/get_all_payment_methods_to_select_usecase/get_all_payment_methods_to_select_usecase.dart';
import '../../../../domain/usecases/product_usecases/get_all_products_to_select_usecase/get_all_products_to_select_usecase.dart';
import '../../../../domain/usecases/product_usecases/product_types_usecases/get_all_product_types_to_select_usecases/get_all_product_types_to_select_usecase.dart';
import '../../../../domain/usecases/purchase_request_usecases/create_purchase_request_usecases/create_purchase_request_usecase.dart';
import '../../../../domain/usecases/purchase_request_usecases/get_all_purchase_request_type_to_select_usecase/get_all_purchase_request_type_to_select_usecase.dart';

import 'package:collection/collection.dart';

import '../../../miscellaneous/item_selection_controller.dart';

part 'purchase_request_create_controller.g.dart';

class PurchaseRequestCreateController = PurchaseRequestCreateControllerAbstract with _$PurchaseRequestCreateController;

abstract class PurchaseRequestCreateControllerAbstract with Store {
  @observable
  bool isFirstLoading = false;
  @observable
  bool isCostCenterLoading = false;
  @observable
  bool isFarmLoading = false;
  @observable
  bool isEmployeeLoading = false;
  @observable
  bool isProductLoading = false;
  @observable
  bool isCompanyLoading = false;
  @observable
  bool isPaymentMethodLoading = false;



  @observable
  List<SelectEntity> purchaseRequestTypeListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> costCenterListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> costCenterByCostCenterTypeIdListToSelect = ObservableList();
  @observable
  List<SelectEntity> farmsByCostCenterIdListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> employeeByFarmIdListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> paymentMethodListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> deliveryLocationListToSelect = ObservableList<SelectEntity>();


  // --- Listas Relacionadas a Produtos ---
  @observable
  List<SelectEntity> productListToSelect = ObservableList<SelectEntity>();
  List<SelectEntity> _allProducts = [];
  @observable
  List<SelectEntity> productTypesListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> filteredProductTypeListToSelect = ObservableList<SelectEntity>();

  // --- Listas Relacionadas a Empresas ---
  @observable
  List<SelectEntity> companiesListToSelect = ObservableList<SelectEntity>();
  List<SelectEntity> _allCompaniesToSelect = [];
  @observable
  List<CompanyEntity> companiesList = ObservableList<CompanyEntity>();
  @observable
  List<SelectEntity> companySegmentsListToSelect = ObservableList<SelectEntity>();
  @observable
  List<SelectEntity> filteredCompanySegmentsListToSelect = ObservableList<SelectEntity>();
  @observable
  String cityFilterText = '';
  @observable
  String stateFilterText = '';
  @observable
  ObservableSet<int> selectedCompanyIds = ObservableSet<int>();

  Map<int, String> companySegmentNames = {}; // Mapa privado



  @observable
  List<ItemsEntity> requestedProductItems = ObservableList<ItemsEntity>();

  @observable
  List<ItemsEntity> finalRequestedProducts = ObservableList<ItemsEntity>();


  SelectEntity? employee;
  @observable
  SelectEntity? purchaseRequestType;
  @observable
  SelectEntity? costCenter;
  @observable
  SelectEntity? farm;
  @observable
  SelectEntity? paymentMethod;

  @observable
  String searchQuery = '';
  @observable
  ItemType? currentLoadedItemType;

  @observable
  bool isUrgent = false;

  @observable
  String quotationExpirationDate = '';

  @observable
  String paymentDate = '';


  @observable
  SelectEntity? deliveryLocationId;

  List<SelectEntity> get allProducts => _allProducts;
  List<SelectEntity> get allCompaniesToSelect => _allCompaniesToSelect;


  @action
  void updateSearchQuery(String query) {
    searchQuery = query;
  }

  @computed
  List get filteredAddItemsList {
    if (currentLoadedItemType == null) {
      return []; // Retorna lista vazia se o tipo de item não estiver definido
    }

    List baseList;
    if (currentLoadedItemType == ItemType.product) {
      baseList = requestedProductItems; // Base list para produtos (ItemsEntity)
    } else { // ItemType.company
      baseList = companiesListToSelect; // <--- Usar companiesListToSelect para empresas (SelectEntity)
    }

    // Aplica filtro de busca se searchQuery não estiver vazio
    if (searchQuery.isEmpty) {
      return baseList; // Retorna lista base (já filtrada por outros critérios, se aplicável) se não houver busca
    } else {
      // Filtra a lista baseada no texto de busca (case-insensitive)
      return baseList.where((item) {
        if (currentLoadedItemType == ItemType.product) {
          // Filter logic for ItemsEntity
          final productItem = item as ItemsEntity;
          return productItem.productName != null &&
              productItem.productName!.toLowerCase().contains(searchQuery.toLowerCase());
        } else { // ItemType.company
          // Filter logic for SelectEntity
          final companyItem = item as SelectEntity; // <--- Cast para SelectEntity
          return companyItem.label != null && companyItem.label!.toLowerCase().contains(searchQuery.toLowerCase());
        }
      }).toList();
    }
  }

  // <--- Adicionado: Lista computada que filtra os métodos de pagamento para o Autocomplete
  @computed
  List<SelectEntity> get filteredPaymentMethodList {
    if (searchQuery.isEmpty) {
      return paymentMethodListToSelect; // Retorna a lista completa se a busca estiver vazia
    } else {
      // Filtra a lista de métodos de pagamento baseada no texto de busca (case-insensitive)
      return paymentMethodListToSelect.where((method) =>
      method.label != null && method.label!.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
  }


  // --- Ações Gerais (Mantidas e Ajustadas) ---

  @action
  void updateCostCenterAndReload(SelectEntity costCenter) {
    this.costCenter = costCenter;
    farm = null;
    farmsByCostCenterIdListToSelect.clear();
    getAllFarmsByCostCenterIdToSelect(costCenter.value);
  }

  @action
  void updateFarmAndReload(SelectEntity farm) {
    this.farm = farm;
    employee = null;
    employeeByFarmIdListToSelect.clear();
    getAllEmployeesByFarmIdToSelect(farm.value);
  }

  @action
  void updateEmployee(SelectEntity employee) {
    this.employee = employee;
  }

  // Estas ações parecem não ser mais usadas, podem ser removidas se for o caso.
  @action
  void updateRequestItems(int index) {}

  @action
  void updateRequestItemsQuantity({required int id, required int value}) {}

  // --- Ações de Produtos ---

  @action
  void incrementRequestedProductQuantity(int productId) {
    final index = requestedProductItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      final currentItem = requestedProductItems[index];
      final updatedItem = currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity + 1);
      requestedProductItems[index] = updatedItem;
      updateFinalRequestedProducts(); // Atualiza a lista final de selecionados
    }
  }

  @action
  void decrementRequestedProductQuantity(int productId) {
    final index = requestedProductItems.indexWhere((item) => item.productId == productId);
    if (index != -1) {
      final currentItem = requestedProductItems[index];
      // Impede que a quantidade fique negativa
      if (currentItem.requestedQuantity > 0) {
        final updatedItem = currentItem.copyWith(requestedQuantity: currentItem.requestedQuantity - 1);
        requestedProductItems[index] = updatedItem;
        updateFinalRequestedProducts(); // Atualiza a lista final de selecionados
      }
    }
  }

  // Ação para remover um produto da lista final de requisitados
  @action
  void removeRequestedProduct(int productId) {
    requestedProductItems.removeWhere((item) => item.productId == productId);
    updateFinalRequestedProducts(); // Atualiza a lista final após remover
  }


  @action
  Future<void> getAllProductsToSelect() async {
    isProductLoading = true; // Usar estado de loading específico para produtos

    final getAllProductsToSelect = Modular.get<GetAllProductsToSelectUsecase>();
    final result = await getAllProductsToSelect(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      _allProducts = success; // Armazena todos os produtos aqui
      productListToSelect = ObservableList<SelectEntity>.of(success); // Lista de produtos exibida (inicialmente todos)

      // Inicializa requestedProductItems com todos os produtos e quantidade 0
      requestedProductItems.clear();
      requestedProductItems.addAll(_allProducts.map((selectEntity) => ItemsEntity(
        productId: selectEntity.value,
        productName: selectEntity.label,
        requestedQuantity: 0,
      )));
      return success;
    });
    isProductLoading = false;
  }

  @action
  Future<void> getAllProductTypesToSelect() async {
    isProductLoading = true; // Usar estado de loading específico

    final getAllProductTypesToSelect = Modular.get<GetAllProductTypesToSelectUsecase>();
    final result = await getAllProductTypesToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      productTypesListToSelect = success;
      return success;
    });
    isProductLoading = false;
  }

  @action
  Future<void> applyProductFilters() async {
    isProductLoading = true; // Usar estado de loading específico para filtro

    // Se nenhum filtro de tipo de produto for selecionado, exibe todos os produtos
    if (filteredProductTypeListToSelect.isEmpty) {
      // Restaura as quantidades requisitadas para a lista completa de produtos
      final currentRequestedProductQuantities =
      Map.fromEntries(requestedProductItems.map((item) => MapEntry(item.productId, item.requestedQuantity)));

      requestedProductItems.clear(); // Limpa a lista atualmente exibida
      productListToSelect.clear(); // Limpa a lista de SelectEntity exibida

      // Re-adiciona todos os produtos da lista inicial completa, restaurando as quantidades
      requestedProductItems.addAll(_allProducts.map((selectEntity) => ItemsEntity(
        productId: selectEntity.value,
        productName: selectEntity.label,
        requestedQuantity: currentRequestedProductQuantities[selectEntity.value] ?? 0,
      )));
      productListToSelect.addAll(_allProducts); // Atualiza productListToSelect também
      isProductLoading = false;
      return;
    }

    List<int> filteredProductTypeIds = filteredProductTypeListToSelect.map((entity) => entity.value).toList();

    final getAllProductsByTypeIdToSelectUsecase = Modular.get<GetAllProductsByTypeIdToSelectUsecase>();
    final result = await getAllProductsByTypeIdToSelectUsecase(ArgParams(firstArgs: filteredProductTypeIds));
    result.fold((error) => error.friendlyMessage, (success) {
      // 'success' aqui é a lista de SelectEntity dos produtos filtrados
      // Precisamos atualizar requestedProductItems com base nesta lista, preservando as quantidades

      final currentRequestedQuantities =
      Map.fromEntries(requestedProductItems.map((item) => MapEntry(item.productId, item.requestedQuantity)));

      requestedProductItems.clear(); // Limpa a lista atualmente exibida
      productListToSelect.clear(); // Limpa a lista de SelectEntity exibida

      // Adiciona os produtos filtrados, restaurando suas quantidades se já existiam
      requestedProductItems.addAll(success.map((selectEntity) => ItemsEntity(
        productId: selectEntity.value,
        productName: selectEntity.label,
        requestedQuantity: currentRequestedQuantities[selectEntity.value] ?? 0, // Restaura ou define 0
      )));

      // Atualiza productListToSelect também se for usada em outro lugar
      productListToSelect = ObservableList<SelectEntity>.of(success);

      return success;
    });
    isProductLoading = false;
  }

  @action
  void updateSelectedProductTypes(Set<int> selectedIds) {
    filteredProductTypeListToSelect.clear();
    for (var id in selectedIds) {
      filteredProductTypeListToSelect
          .addAll(productTypesListToSelect.where((selectEntity) => selectEntity.value == id));
    }
    applyProductFilters(); // Aplica o filtro
  }

  @action
  void clearSelectedProductTypes() {
    filteredProductTypeListToSelect.clear();
    applyProductFilters(); // Aplica o filtro para mostrar todos os produtos
  }

  @action
  void updateFinalRequestedProducts() {
    finalRequestedProducts =
    ObservableList<ItemsEntity>.of(requestedProductItems.where((item) => item.requestedQuantity > 0).toList());
  }

  // --- Ações de Empresas ---

  @action
  void toggleCompanySelection(int companyId, bool isSelected) {
    if (isSelected) {
      selectedCompanyIds.add(companyId);
    } else {
      selectedCompanyIds.remove(companyId);
    }
    // A lista finalRequestedCompanies (computada) será atualizada automaticamente
  }

  // Ação para remover uma empresa da lista de selecionados
  @action
  void removeSelectedCompany(int companyId) {
    selectedCompanyIds.remove(companyId);
    // finalRequestedCompanies será atualizado automaticamente por ser computed
  }


  // Metodo público para obter o nome do segmento de uma empresa pelo ID
  String getCompanySegmentName(int companyId) {
    // Busca o nome do segmento no mapa privado. Retorna um fallback se não encontrar.
    // Este mapa deve ser populado ao carregar os segmentos ou empresas com detalhes.
    // Para este exemplo, vamos buscar nos detalhes da CompanyEntity se disponível.
    final companyDetails = companiesList.firstWhereOrNull((company) => company.id == companyId);
    if (companyDetails != null && companyDetails.segments != null && companyDetails.segments!.isNotEmpty) {
      // Assumindo que a empresa tem apenas um segmento principal para exibição no tile
      return companyDetails.segments!.first.name ?? 'Sem Segmento';
    }
    return 'Sem Segmento'; // Fallback se detalhes ou segmentos não encontrados
  }

  // Metodo para verificar se uma empresa está selecionada
  bool isCompanySelected(int companyId) {
    // Verifica o estado isSelected no SelectEntity correspondente
    // NÃO! Verifica se o ID da empresa está no set selectedCompanyIds
    return selectedCompanyIds.contains(companyId);
  }

  // Ação para buscar a lista completa de CompanyEntity
  @action
  Future<void> getAllCompanies() async {
    isCompanyLoading = true; // Usar estado de loading específico
    final getAllCompanies = Modular.get<GetAllCompaniesUsecase>(); // Seu usecase para buscar CompanyEntity
    final result = await getAllCompanies(NoParams()); // Use NoParams ou ArgParams conforme seu usecase

    result.fold((error) => error.friendlyMessage, (success) {
      companiesList = ObservableList<CompanyEntity>.of(success); // Popula companiesList com CompanyEntity
      // Opcional: Popular _companySegmentNames aqui se CompanyEntity contiver o nome/ID do segmento
      // for (var company in companiesList) {
      //   _companySegmentNames[company.id] = company.segmentName ?? 'Desconhecido'; // Exemplo: assumindo company.id e company.segmentName
      // }
    });
    isCompanyLoading = false;
  }


  @action
  Future<void> getAllCompaniesToSelect() async {
    isCompanyLoading = true; // Usar estado de loading específico para empresas

    final getAllCompaniesToSelect = Modular.get<GetAllCompaniesToSelectUsecase>(); // Seu usecase para buscar SelectEntity
    final result = await getAllCompaniesToSelect(NoParams()); // Ou com parâmetros se precisar

    result.fold((error) => error.friendlyMessage, (success) {
      _allCompaniesToSelect = success; // Armazena todas as empresas (SelectEntity) buscadas inicialmente
      companiesListToSelect = ObservableList<SelectEntity>.of(success); // Lista de empresas exibida (inicialmente todos)
      // REMOVIDO: Inicializa requestedCompanyItems aqui
      return success;
    });
    isCompanyLoading = false;
  }

  @action
  Future<void> getAllCompanySegmentsToSelect() async {
    isCompanyLoading = true; // Usar estado de loading específico

    final getAllCompanySegmentsToSelectUsecase = Modular.get<GetAllCompanySegmentsToSelectUsecase>(); // Você precisa implementar este Usecase
    final result = await getAllCompanySegmentsToSelectUsecase(ArgParams());

    result.fold((error) => error.friendlyMessage, (success) {
      companySegmentsListToSelect = success;

      // Opcional: Popular _companySegmentNames aqui se a API de segmentos retornar a relação empresa-segmento
      // for (var segment in companySegmentsListToSelect) {
      //   // Assumindo que SelectEntity para segmento tem uma forma de acessar os IDs das empresas associadas
      //   // for (var companyId in segment.associatedCompanyIds) {
      //   //   _companySegmentNames[companyId] = segment.label ?? 'Desconhecido';
      //   // }
      // }

      return success;
    });
    isCompanyLoading = false;
  }

  @action
  void updateSelectedCompanySegments(Set<int> selectedIds) {
    filteredCompanySegmentsListToSelect.clear();
    for (var id in selectedIds) {
      filteredCompanySegmentsListToSelect.addAll(
          companySegmentsListToSelect.where((selectEntity) => selectEntity.value == id));
    }
    applyCompanyFilters(); // Aplica o filtro
  }

  @action
  void clearSelectedCompanySegments() {
    filteredCompanySegmentsListToSelect.clear();
    // Decida se limpar filtros deve limpar seleções. Se sim:
    // selectedCompanyIds.clear();
    applyCompanyFilters(); // Aplica o filtro para mostrar todas as empresas
  }

  @action
  void updateStateFilter(String text) {
    stateFilterText = text;
    // Opcional: Se você quiser aplicar o filtro de empresas
    // em tempo real enquanto o usuário digita o estado,
    // descomente a linha abaixo.
    applyCompanyFilters();
  }

  @action
  void updateCityFilter(String text) {
    cityFilterText = text;
    // Opcional: Aplicar filtro em tempo real ou apenas ao clicar em "Aplicar"
    // Se a lista de empresas for grande, é melhor filtrar apenas ao clicar em "Aplicar"
    // applyCompanyFilters(); // Descomente se quiser filtro em tempo real
  }

  @action
  void applyCityFilter() {
    applyCompanyFilters(); // Aplica o filtro de cidade (chamado pelo botão "Aplicar")
  }


  @action
  void clearSelectedCityFilter() {
    cityFilterText = '';
    applyCompanyFilters(); // Aplica o filtro para mostrar todas as empresas
  }

  // <--- Adicionado: Metodo para obter lista de estados únicos das empresas carregadas
  Iterable<String> getUniqueStates() {
    // Filtra empresas que têm um estado válido e retorna a lista de estados únicos, ordenados.
    return companiesList
        .where((company) => company.addressState != null && company.addressState!.isNotEmpty)
        .map((company) => company.addressState!)
        .toSet() // Garante que os estados são únicos
        .toList()
        .sorted((a, b) => a.compareTo(b)); // Ordena alfabeticamente
  }

  // <--- Adicionado: Metodo para obter lista de cidades únicas das empresas carregadas
  // Opcional: Filtrar por estado, se fornecido
  Iterable<String> getUniqueCities({String? state}) {
    // Filtra empresas que têm uma cidade válida
    var filteredCompanies = companiesList
        .where((company) => company.addressCity != null && company.addressCity!.isNotEmpty);

    // Se um estado for fornecido, filtra ainda mais por estado
    if (state != null && state.isNotEmpty) {
      filteredCompanies = filteredCompanies.where((company) =>
      company.addressState != null && company.addressState!.toLowerCase() == state.toLowerCase());
    }

    // Retorna a lista de cidades únicas das empresas filtradas, ordenadas.
    return filteredCompanies
        .map((company) => company.addressCity!)
        .toSet() // Garante que as cidades são únicas
        .toList()
        .sorted((a, b) => a.compareTo(b)); // Ordena alfabeticamente
  }


  @action
  Future<void> applyCompanyFilters() async {
    isCompanyLoading = true; // Usar estado de loading específico para filtro

    // Determine quais filtros estão ativos
    final bool hasSegmentFilter = filteredCompanySegmentsListToSelect.isNotEmpty;
    final bool hasCityFilter = cityFilterText.isNotEmpty;
    final bool hasStateFilter = stateFilterText.isNotEmpty; // <--- Adicionado: Verifica se há filtro de estado

    List<SelectEntity> filteredCompaniesSelectEntity = []; // Lista temporária para SelectEntity filtradas
    // dynamic result; // Variável para armazenar o resultado dos usecases - Não usada no filtro client-side

    // <--- Lógica de filtro client-side ajustada para incluir filtro de estado
    // Assumindo que _allCompaniesToSelect tem todos os dados necessários para filtrar por segmento, cidade e estado.
    // Se você precisar buscar dados filtrados da API, precisará adaptar esta lógica
    // para chamar os usecases apropriados com os parâmetros de filtro.
    filteredCompaniesSelectEntity = _allCompaniesToSelect.where((companySelect) {
      // Para filtrar _allCompaniesToSelect (que são SelectEntity), precisamos
      // obter os detalhes completos da CompanyEntity correspondente para acessar
      // as propriedades de segmento, cidade e estado.
      final CompanyEntity? companyDetails = getCompanyDetails(companySelect.value);

      // Se os detalhes não forem encontrados, não inclui a empresa na lista filtrada.
      if (companyDetails == null) {
        return false;
      }

      bool matchesSegment = true;
      if (hasSegmentFilter) {
        // Verifica se a lista de segmentos da empresa contém algum dos IDs de segmento selecionados
        matchesSegment = companyDetails.segments != null &&
            companyDetails.segments!.any((segment) => filteredCompanySegmentsListToSelect.any((filterSegment) => filterSegment.value == segment.id));
      }

      bool matchesCity = true;
      if (hasCityFilter) {
        // Verifica se o nome da cidade da empresa contém o texto do filtro (case-insensitive)
        matchesCity = companyDetails.addressCity != null && companyDetails.addressCity!.toLowerCase().contains(cityFilterText.toLowerCase());
      }

      bool matchesState = true;
      if (hasStateFilter) {
        // Verifica se o nome do estado da empresa contém o texto do filtro (case-insensitive)
        matchesState = companyDetails.addressState != null && companyDetails.addressState!.toLowerCase().contains(stateFilterText.toLowerCase());
      }

      // A empresa corresponde aos filtros se corresponder a todos os filtros ativos
      return matchesSegment && matchesCity && matchesState;

    }).toList();


    // Atualiza companiesListToSelect com a lista filtrada (SelectEntity)
    // Esta é a lista que a UI de adicionar empresas (com checkboxes) irá observar
    companiesListToSelect = ObservableList<SelectEntity>.of(filteredCompaniesSelectEntity);

    // REMOVIDO: Atualiza requestedCompanyItems aqui

    isCompanyLoading = false;
  }


  // Esta função computada retorna a lista final de empresas selecionadas (SelectEntity)
  @computed // Mantém a anotação @computed
  List<SelectEntity> get finalRequestedCompanies { // Altera para sintaxe de getter
    // Filtra a lista completa de empresas SelectEntity (_allCompaniesToSelect) para encontrar as que estão em selectedCompanyIds
    return ObservableList<SelectEntity>.of(
        _allCompaniesToSelect.where((company) => selectedCompanyIds.contains(company.value)).toList()
    );
  }

  // Metodo público para obter os detalhes completos de uma empresa (CompanyEntity) pelo ID
  CompanyEntity? getCompanyDetails(int companyId) {
    // Busca na lista completa de CompanyEntity pelos detalhes
    return companiesList.firstWhereOrNull((company) => company.id == companyId);
  }


  // --- Ação de Carregamento Inicial (chamada pela página AddItems com base no ItemType) ---
  @action
  Future<void> loadItems(ItemType type) async {
    isFirstLoading = true; // Indica que um carregamento inicial está ocorrendo
    // Resetar estados de loading específicos antes de carregar
    isProductLoading = false;
    isCompanyLoading = false;
    currentLoadedItemType = type; // <--- Define o tipo de item carregado
    searchQuery = ''; // <--- Limpa o estado de busca ao carregar novos itens

    if (type == ItemType.product) {
      isProductLoading = true;
      await getAllProductsToSelect();
      await getAllProductTypesToSelect();
      isProductLoading = false;
    } else if (type == ItemType.company) {
      isCompanyLoading = true;
      await getAllCompanies(); // Carrega a lista completa de CompanyEntity
      await getAllCompaniesToSelect(); // Carrega a lista completa de SelectEntity e popula companiesListToSelect
      await getAllCompanySegmentsToSelect(); // Carrega segmentos para o filtro
      // Não aplicamos filtro inicial aqui, getAllCompaniesToSelect já carrega todos
      isCompanyLoading = false;
    }
    isFirstLoading = false; // Finaliza o loading inicial
  }

  // <--- Adicionado: Ação para carregar métodos de pagamento
  @action
  Future<void> getAllPaymentMethodsToSelect() async {
    isPaymentMethodLoading = true;
    searchQuery = ''; // Limpa a busca ao carregar métodos de pagamento

    final getAllPaymentMethodsToSelect = Modular.get<GetAllPaymentMethodsToSelectUsecase>();
    final result = await getAllPaymentMethodsToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      paymentMethodListToSelect = ObservableList<SelectEntity>.of(success);
      return success;
    });
    isPaymentMethodLoading = false;
  }

  // <--- Adicionado: Ação para atualizar o metodo de pagamento selecionado
  @action
  void updatePaymentMethod(SelectEntity selectedMethod) {
    paymentMethod = selectedMethod;
    // Opcional: Limpar a busca após selecionar
    searchQuery = '';
  }

  // <--- Adicionado: Ação para alternar o estado de urgência
  @action
  void toggleIsUrgent(bool? newValue) {
    if (newValue != null) {
      isUrgent = newValue;
    }
  }


  // --- Ação para Resetar o Estado (útil ao iniciar um novo processo de criação) ---
  @action
  void resetState() {
    isFirstLoading = false;
    isCostCenterLoading = false;
    isFarmLoading = false;
    isEmployeeLoading = false;
    isProductLoading = false;
    isCompanyLoading = false;
    isPaymentMethodLoading = false;


    purchaseRequestTypeListToSelect.clear();
    costCenterListToSelect.clear();
    farmsByCostCenterIdListToSelect.clear();
    employeeByFarmIdListToSelect.clear();
    paymentMethodListToSelect.clear(); // <--- Adicionado: Limpar lista de métodos de pagamento


    productListToSelect.clear();
    _allProducts.clear();
    productTypesListToSelect.clear();
    filteredProductTypeListToSelect.clear();
    requestedProductItems.clear();
    finalRequestedProducts.clear();

    companiesListToSelect.clear();
    companiesList.clear(); // Limpa a lista de CompanyEntity
    _allCompaniesToSelect.clear(); // Limpa a lista de SelectEntity completa
    companySegmentsListToSelect.clear();
    filteredCompanySegmentsListToSelect.clear();
    cityFilterText = '';
    stateFilterText = ''; // <--- Limpa o filtro de estado
    selectedCompanyIds.clear(); // Limpa os IDs de empresas selecionadas
    companySegmentNames.clear(); // Limpa o mapa de nomes de segmento
    // REMOVIDO: requestedCompanyItems.clear(); // <--- Limpa a lista de CompanyItemEntity


    // Estado e Lógica de Busca
    searchQuery = ''; // <--- Limpa o estado de busca
    currentLoadedItemType = null; // <--- Limpa o tipo de item carregado
    paymentMethod = null; // <--- Adicionado: Resetar metodo de pagamento selecionado


    // Estado de Urgência
    isUrgent = false; // <--- Adicionado: Resetar flag de urgência


    // Entidades Selecionadas (Mantidas)
    employee = null;
    purchaseRequestType = null;
    costCenter = null;
    farm = null;
  }

  // --- Métodos de Carregamento Geral (Mantidos) ---

  @action
  Future<void> getAllPurchaseRequestTypeToSelect() async {
    isFirstLoading = true; // Pode usar isFirstLoading ou um estado específico

    final getAllPurchaseRequestTypeTSelect = Modular.get<GetAllPurchaseRequestTypeToSelectUsecase>();
    final result = await getAllPurchaseRequestTypeTSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      purchaseRequestTypeListToSelect = success;
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllCostCenterToSelect() async {
    isFirstLoading = true; // Pode usar isFirstLoading ou um estado específico

    final getAllCostCenterToSelect = Modular.get<GetAllCostCentersToSelectUsecase>();
    final result = await getAllCostCenterToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      costCenterListToSelect = success;
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllCostCentersByCostCenterTypeIdToSelect() async {
    isCostCenterLoading = true;
    final getAllCostCentersByCostCenterTypeIdToSelect = Modular.get<GetAllCostCentersByCostCenterTypeIdToSelectUsecase>();
    final result = await getAllCostCentersByCostCenterTypeIdToSelect(ArgParams(firstArgs: 1));
    result.fold((error) => error.friendlyMessage, (success) {
      costCenterByCostCenterTypeIdListToSelect = success;
      return success;
    });
    isCostCenterLoading = false;
  }

  Future<void> getAllDeliveryLocationsToSelect() async {
    isFirstLoading = true;

    final getAllDeliveryLocationsToSelect = Modular.get<GetAllPurchaseRequestDeliveryLocationsToSelectUsecase>();
    final result = await getAllDeliveryLocationsToSelect(NoParams());

    result.fold((error) => error.friendlyMessage, (success) {
      deliveryLocationListToSelect = ObservableList<SelectEntity>.of(success);
      return success;
    });
    isFirstLoading = false;
  }

  @action
  Future<void> getAllFarmsByCostCenterIdToSelect(int costCenterId) async {
    isFarmLoading = true; // Estado de loading específico

    final getAllFarmsByCostCenterIdToSelect = Modular.get<GetAllFarmsByCostCenterIdToSelectUsecase>();
    final result = await getAllFarmsByCostCenterIdToSelect(ArgParams(firstArgs: costCenterId));

    result.fold((error) => error.friendlyMessage, (success) {
      farmsByCostCenterIdListToSelect = success;
      return success;
    });
    isFarmLoading = false;
  }

  @action
  Future<void> getAllEmployeesByFarmIdToSelect(int farmId) async {
    isEmployeeLoading = true; // Estado de loading específico

    final getAllEmployeesByFarmIdToSelect = Modular.get<GetAllEmployeesByFarmIdToSelectUsecase>();
    final result = await getAllEmployeesByFarmIdToSelect(ArgParams(firstArgs: farmId));

    result.fold((error) => error.friendlyMessage, (success) {
      employeeByFarmIdListToSelect = success;
      return success;
    });
    isEmployeeLoading = false;
  }

  @action
  Future<void> createPurchaseRequest(BuildContext context) async {
    isPaymentMethodLoading = true;

    final argParams = ArgParams(
      firstArgs: SendPurchaseRequestEntity(
        quotationExpirationDate: DateTimeFormatter.convertDdMmYyyySlashToIso8601(quotationExpirationDate),
        paymentDate: DateTimeFormatter.convertDdMmYyyySlashToIso8601(paymentDate),
        deliveryLocationId: deliveryLocationId?.value,
        isUrgent: isUrgent,
        typeId: purchaseRequestType?.value,
        farmId: farm?.value,
        costCenterId: costCenter?.value,
        responsibleEmployeeId: employee?.value,
        paymentMethodId: paymentMethod?.value,
        companyIds: finalRequestedCompanies.map((company) => company.value).toList(),
        items: finalRequestedProducts.map((item) => ItemsEntity(
          productId: item.productId,
          requestedQuantity: item.requestedQuantity,
        )).toList(),
      )
    );


    final createPurchaseRequest = Modular.get<CreatePurchaseRequestUsecase>();
    final result = await createPurchaseRequest(argParams);
    result.fold((error) => error.friendlyMessage, (success) {
      CustomSnackBarWidget.show(SnackBarType.success, context, 'Cotação de compra criada com sucesso.'
      );
    });
    isPaymentMethodLoading = false;

  }

}









