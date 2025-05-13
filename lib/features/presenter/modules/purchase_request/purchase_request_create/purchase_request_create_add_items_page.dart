import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/appbar/custom_appbar_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/background/background_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/buttons/custom_floating_action_button_widget.dart';
import 'package:new_ezagro_flutter/features/presenter/widgets/filter_bottom_sheet/filter_companies_bottom_sheet_widget.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../domain/entities/items_entities/items_entity.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_edit_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_selectable_tile_widget.dart'; // Importar o novo widget
import '../../../widgets/filter_bottom_sheet/filter_products_bottom_sheet_widget.dart';
import '../../../../domain/entities/select_entities/select_entity.dart'; // Importar SelectEntity
import '../../../../domain/entities/company_entities/company_entity.dart'; // Importar CompanyEntity para usar os detalhes

class PurchaseRequestCreateAddItemsPage extends StatefulWidget { // <--- Convertido para StatefulWidget
  final ArgParams args;

  static const String routePath = AppRoutes.addPurchaseRequestCreateAddItemsPage;

  // Metodo push agora requer ArgParams contendo o ItemType
  static void push({required ArgParams args}) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateAddItemsPage({super.key, required this.args});

  @override
  State<PurchaseRequestCreateAddItemsPage> createState() => _PurchaseRequestCreateAddItemsPageState(); // <--- Criação do Estado
}

class _PurchaseRequestCreateAddItemsPageState extends State<PurchaseRequestCreateAddItemsPage> { // <--- Estado da página
  final controller = Modular.get<PurchaseRequestCreateController>();
  final TextEditingController _autocompleteController = TextEditingController(); // <--- Controller para o Autocomplete

  @override
  void initState() {
    super.initState();
    // Recupera o ItemType dos argumentos no initState
    final ItemType currentItemType = widget.args.firstArgs;

    // Carrega os itens apropriados (produtos ou empresas) apenas uma vez
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Verifica se os itens já foram carregados para evitar chamadas repetidas
      // Isso pode ser feito verificando o estado de loading ou uma flag na controller
      // Ex: if (!controller.isInitialItemsLoadedForType(currentItemType)) {
      controller.loadItems(currentItemType);
      // }
    });
  }


  @override
  void dispose() {
    _autocompleteController.dispose(); // <--- Dispose do controller do Autocomplete
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Recupera o ItemType dos argumentos (agora do widget)
    final ItemType currentItemType = widget.args.firstArgs;


    // Decida os labels para o cabeçalho da lista com base no tipo de item
    final String firstLabel = currentItemType == ItemType.product ? 'Nome' : 'Nome';
    final String secondLabel = currentItemType == ItemType.product ? 'Quantidade' : 'CNPJ'; // Label agora é CNPJ
    // O terceiro label ('Selecionar') só faz sentido para empresas
    // final String thirdLabel = currentItemType == ItemType.company ? 'Selecionar' : '';


    return BackgroundWidget(
      scrollable: true,
      floatButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botão de Filtro - Mostra o BottomSheet correto
                CustomFloatingActionButtonWidget(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true, // Permite que o BottomSheet ocupe mais espaço se necessário
                        builder: (context) {
                          if(currentItemType == ItemType.company){
                            // Passa a lista correcta de segmentos de empresa para o filtro de empresas
                            return FilterCompaniesBottomSheetWidget(
                                companySegmentsList: controller.companySegmentsListToSelect);
                          }
                          // Passa a lista correcta de tipos de produto para o filtro de produtos
                          return FilterProductsBottomSheetWidget(
                              productTypesList: controller.productTypesListToSelect);
                        });
                  },
                  backgroundColor: AppColors.primaryWhiteColor,
                  icon: Icons.filter_alt_outlined,
                  iconColor: AppColors.primaryBlackColor,
                  // Tags Hero únicas baseadas no tipo de item
                  heroTag: currentItemType == ItemType.product ? 'filter_product_button' : 'filter_company_button',
                ),
                // Botão de Check - Retorna para a tela anterior
                CustomFloatingActionButtonWidget(
                  onPressed: () => PurchaseRequestCreateAddItemsPage.pop(),
                  backgroundColor: AppColors.primaryGreenColor,
                  icon: Icons.check,
                  iconColor: AppColors.primaryWhiteColor,
                  // Tags Hero únicas baseadas no tipo de item
                  heroTag: currentItemType == ItemType.product ? 'check_product_button' : 'check_company_button',
                ),
              ],
            ),
          )

        ],
      ),
      appBar: CustomAppBarWidget(
        appBarType: AppBarType.centeredTitleAndBackArrow,
        // Título pode ser adaptado com base no tipo de item
        title: currentItemType == ItemType.product
            ? AppStringsPortuguese.newPurchaseRequestString // Título para produtos
            : 'Adicionar Empresas', // Título para empresas (Exemplo)
        callback: () => PurchaseRequestCreateAddItemsPage.pop(),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Observer(
          // Observa o estado de loading geral ou específico
          builder: (context) {
            // Use o estado de loading apropriado
            final bool isLoading = currentItemType == ItemType.product
                ? controller.isProductLoading // Observe o loading de produtos
                : controller.isCompanyLoading; // Observe o loading de empresas

            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              // Decide qual lista observar e usar no ListView.builder
              final List itemsList = currentItemType == ItemType.product
                  ? controller.requestedProductItems // Lista de produtos (ItemsEntity)
                  : controller.companiesListToSelect; // Lista de empresas (SelectEntity)


              return Column(
                children: [
                  // --- Autocomplete Widget ---
                  Autocomplete<String>(
                    // Use o controller local para o Autocomplete
                    fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                      // Sincroniza o controller local com o Autocomplete
                      _autocompleteController.text = fieldTextEditingController.text;
                      return TextField(
                        controller: fieldTextEditingController, // Use o controller fornecido pelo Autocomplete
                        focusNode: fieldFocusNode,
                        decoration: InputDecoration(
                          hintText: currentItemType == ItemType.product ? 'Buscar produto...' : 'Buscar empresa...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.formGreyColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.formGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.primaryGreenColor, width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        ),
                        onChanged: (text) {
                          // Opcional: Chamar uma action na controller para filtrar a lista exibida em tempo real
                          // controller.applySearchFilter(text, currentItemType); // Exemplo
                        },
                        onSubmitted: (String value) {
                          onFieldSubmitted(); // Dispara o onFieldSubmitted do Autocomplete
                          // Opcional: Realizar uma ação ao submeter (ex: buscar e rolar para o item)
                        },
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      // Fornece as sugestões com base na lista atual de itens (produtos ou empresas)
                      if (textEditingValue.text.isEmpty) {
                        // Se o texto estiver vazio, retorna todos os nomes/labels da lista atual
                        if (currentItemType == ItemType.product) {
                          return (itemsList as List<ItemsEntity>).map((item) => item.productName ?? '').where((name) => name.isNotEmpty);
                        } else { // ItemType.company
                          return (itemsList as List<SelectEntity>).map((item) => item.label ?? '').where((label) => label.isNotEmpty);
                        }
                      }

                      // Filtra as sugestões com base no texto digitado (case-insensitive)
                      if (currentItemType == ItemType.product) {
                        return (itemsList as List<ItemsEntity>)
                            .map((item) => item.productName ?? '')
                            .where((name) => name.isNotEmpty && name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                      } else { // ItemType.company
                        return (itemsList as List<SelectEntity>)
                            .map((item) => item.label ?? '')
                            .where((label) => label.isNotEmpty && label.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                      }
                    },
                    onSelected: (String selection) {
                      // Ação ao selecionar uma sugestão
                      debugPrint('Sugestão selecionada: $selection');
                      // Opcional: Implementar lógica para rolar a lista até o item selecionado
                      // Isso exigiria um ScrollController no ListView e encontrar o índice do item selecionado.
                    },
                    optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                      // Constrói a visualização das opções de sugestão (o dropdown)
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                            height: 200.0, // Altura máxima do dropdown
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option); // Dispara o onSelected do Autocomplete
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(option),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10), // Espaço entre o Autocomplete e o card principal
                  // --- Fim do Autocomplete Widget ---


                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryWhiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(
                          children: [
                            // Usa labels adaptados
                            // Se for empresa, pode precisar adaptar o widget Label para 3 colunas
                            CustomTwoItemsAlternateColorLabelWidget(
                              firstLabel: firstLabel,
                              secondLabel: secondLabel, // Passando CNPJ como segundo label
                              // Se CustomTwoItemsAlternateColorLabelWidget não suporta 3 labels,
                              // você precisará criar uma versão para empresas ou adaptar este widget.
                              // Por enquanto, ele só mostra 2 labels.
                            ),
                            SizedBox(height: 10),
                            Divider(color: AppColors.borderWhiteColor),
                            Observer(builder: (context){
                              // Observa a lista correta
                              if (itemsList.isNotEmpty) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView interno
                                  itemCount: itemsList.length,
                                  itemBuilder: (context, index) {
                                    final item = itemsList[index]; // Pega o item da lista correcta

                                    // Renderiza o widget de item correcto com base no tipo
                                    if (currentItemType == ItemType.product) {
                                      // Item de Produto (com incremento/decremento)
                                      final productItem = item as ItemsEntity; // Cast para o tipo correcto
                                      return Theme( // Mantém o Theme para remover a linha do ExpansionTile
                                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                        child: ExpansionTile( // Mantém ExpansionTile para consistência visual, mesmo sem filhos por padrão
                                          initiallyExpanded: false,
                                          showTrailingIcon: false,
                                          tilePadding: const EdgeInsets.all(0),
                                          trailing: SizedBox(width: 0.0),
                                          title: CustomTwoItemsAlternateColorEditWidget(
                                            index: index,
                                            firstItem: productItem.productName!,
                                            secondItem: productItem.requestedQuantity.toString(),
                                            addQuantity: () => controller.incrementRequestedProductQuantity(productItem.productId),
                                            removeQuantity: () => controller.decrementRequestedProductQuantity(productItem.productId),
                                          ),
                                          // children: [], // Pode adicionar detalhes do produto aqui se necessário
                                        ),
                                      );
                                    } else if (currentItemType == ItemType.company) {
                                      // Item de Empresa (com checkbox)
                                      final companySelectEntity = item as SelectEntity; // Cast para SelectEntity

                                      // Obtém os detalhes completos da empresa para pegar o CNPJ
                                      final CompanyEntity? companyDetails = controller.getCompanyDetails(companySelectEntity.value);

                                      // Obtém o nome do segmento (ainda necessário para o filtro, mas não para o tile agora)
                                      // final String segmentName = controller.getCompanySegmentName(companySelectEntity.value);


                                      return Theme( // Mantém o Theme para consistirência visual
                                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                        child: ExpansionTile( // Mantém ExpansionTile, pode adicionar detalhes da empresa nos children
                                          initiallyExpanded: false,
                                          showTrailingIcon: false,
                                          tilePadding: const EdgeInsets.all(0),
                                          trailing: SizedBox(width: 0.0),
                                          title: CustomTwoItemsAlternateColorSelectableTileWidget(
                                            firstLabel: companySelectEntity.label ?? 'Nome da Empresa', // Usa o label da SelectEntity (Nome)
                                            secondLabel: companyDetails?.legalDocumentNumber ?? 'N/A', // Usa o CNPJ da CompanyEntity
                                            initialIsSelected: controller.isCompanySelected(companySelectEntity.value), // Verifica o estado de seleção na controller
                                            onChanged: (isSelected) {
                                              // Chama a action na controller para atualizar o estado de seleção da empresa
                                              controller.toggleCompanySelection(companySelectEntity.value, isSelected);
                                            },
                                          ),
                                          // children: [], // Pode adicionar detalhes da empresa aqui se necessário
                                        ),
                                      );
                                    }
                                    return Container(); // Fallback caso o tipo não seja reconhecido
                                  },
                                );
                              } else {
                                // Mensagem quando a lista está vazia (pode ser adaptada)
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text(
                                    currentItemType == ItemType.product
                                        ? 'Nenhum produto encontrado.'
                                        : 'Nenhuma empresa encontrada.',
                                    style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                            }),
                          ]
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
