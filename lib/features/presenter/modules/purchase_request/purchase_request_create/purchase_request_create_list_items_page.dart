import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_add_items_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_general_info_first_page.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_payment_method_page.dart';

import '../../../../../consts/app_routes.dart';
import '../../../../../design_system/colors/app_colors.dart';
import '../../../../../design_system/strings/app_strings_portuguese.dart';
import '../../../../../design_system/typography/app_text_styles.dart';
import '../../../../../design_system/widgets/snackbars/custon_snack_bar_widget.dart';
import '../../../../domain/entities/items_entities/items_entity.dart'; // Importar ItemsEntity
import '../../../../domain/entities/select_entities/select_entity.dart'; // Importar SelectEntity
import '../../../../domain/entities/company_entities/company_entity.dart'; // Importar CompanyEntity para usar os detalhes
import '../../../widgets/appbar/custom_appbar_widget.dart';
import '../../../widgets/background/background_widget.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/cards/custom_product_expanded_card_widget.dart'; // Manter por enquanto, mas precisa de adaptação para empresas
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_label_widget.dart';
import '../../../widgets/custom_tiles/custom_two_items_alternate_color_tile_widget.dart';
import '../purchase_request_list/purchase_request_list_page.dart';

class PurchaseRequestCreateListItemsPage extends StatelessWidget {
  final ArgParams args; // Página agora espera argumentos
  static const String routePath = AppRoutes.appPurchaseRequestCreateListItemsPage;

  static void navigate() => Modular.to.navigate(routePath);

  // Metodo push agora requer ArgParams contendo o ItemType
  static void push({required ArgParams args}) => Modular.to.pushNamed(routePath, arguments: args);

  static void pop() => Modular.to.pop();

  const PurchaseRequestCreateListItemsPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    // Recupera o ItemType dos argumentos
    final ItemType currentItemType = args.firstArgs;
    final controller = Modular.get<PurchaseRequestCreateController>();

    // Decida os labels para o cabeçalho da lista com base no tipo de item
    final String firstLabel = currentItemType == ItemType.product ? 'Nome' : 'Nome da Empresa';
    final String secondLabel = currentItemType == ItemType.product ? 'Quantidade' : 'CNPJ';
    // Note: CustomTwoItemsAlternateColorLabelWidget só suporta 2 labels.
    // Se precisar de um terceiro label para empresas (ex: "Selecionado"),
    // você precisará adaptar este widget ou criar uma versão para 3 colunas.


    return BackgroundWidget(
        scrollable: false, // Mantido conforme sua instrução
        appBar: CustomAppBarWidget(
          appBarType: AppBarType.centeredTitleAndBackArrow,
          // Título da AppBar pode ser adaptado se necessário
          title: AppStringsPortuguese.newPurchaseRequestString,
          callback: () => PurchaseRequestListPage.navigate(), // Volta para a lista geral de requisições
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Observer(builder: (context) {
            // Observa o estado de loading apropriado (geral ou específico)
            final bool isLoading = currentItemType == ItemType.product
                ? controller.isProductLoading // Observe o loading de produtos
                : controller.isCompanyLoading; // Observe o loading de empresas

            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              // Decide qual lista final observar e usar no ListView.builder
              final List finalItemsList = currentItemType == ItemType.product
                  ? controller.finalRequestedProducts // Lista final de produtos selecionados
                  : controller.finalRequestedCompanies; // Lista final de empresas selecionadas

              return Column( // Coluna principal para organizar os elementos
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Não use spaceBetween se quiser que o Flexible ocupe o espaço
                children: [
                  // Botão para adicionar itens (navega para AddItemsPage com o tipo correto)
                  GestureDetector(
                    onTap: () {
                      // Navega para a tela de adicionar itens do MESMO tipo
                      PurchaseRequestCreateAddItemsPage.push(args: ArgParams(firstArgs: currentItemType));
                    },
                    child: Text(
                      // Texto do botão pode ser adaptado
                      currentItemType == ItemType.product ? 'Adicionar Produtos' : 'Adicionar Empresas',
                      style: AppTextStyles.underlinedTextButtonStyle(color: AppColors.primaryBlackColor),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Envolve o Container da lista com Flexible para que ele ocupe o espaço restante
                  // Usando Flexible com FlexFit.loose para lidar com constraints unbounded
                  Flexible( // <--- Alterado de Expanded para Flexible
                    fit: FlexFit.loose, // <--- Adicionado fit: FlexFit.loose
                    child: Container(
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
                              // Cabeçalho da lista com labels adaptados
                              CustomTwoItemsAlternateColorLabelWidget(
                                firstLabel: firstLabel,
                                secondLabel: secondLabel,
                              ),
                              SizedBox(height: 10),
                              Divider(color: AppColors.borderWhiteColor),
                              // O ListView.builder interno
                              Observer(builder: (context) {
                                // Observa a lista final correta
                                if (finalItemsList.isNotEmpty) {
                                  return ListView.builder(
                                    shrinkWrap: true, // Mantido para que o ListView ocupe apenas o espaço necessário dentro do Flexible/Container
                                    physics: NeverScrollableScrollPhysics(), // Mantido para desabilitar o scroll interno
                                    itemCount: finalItemsList.length,
                                    itemBuilder: (context, index) {
                                      final selectedItem = finalItemsList[index]; // Pega o item da lista final correta

                                      // Renderiza o tile apropriado com base no tipo de item
                                      if (currentItemType == ItemType.product) {
                                        // Item de Produto
                                        final productItem = selectedItem as ItemsEntity; // Cast para o tipo correto
                                        return Theme( // Mantém o Theme para remover a linha do ExpansionTile
                                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                          child: ExpansionTile( // Mantém ExpansionTile para consistência visual
                                            initiallyExpanded: false,
                                            showTrailingIcon: false,
                                            tilePadding: const EdgeInsets.all(0),
                                            trailing: SizedBox(width: 0.0),
                                            title: CustomTwoItemsAlternateColorTileWidget(
                                                itemType: currentItemType,
                                                index: index, // Índice na lista final
                                                firstItem: productItem.productName!, // Nome do produto
                                                secondItem: productItem.requestedQuantity.toString()), // Quantidade
                                            children: [
                                              // Card expandido para detalhes do produto
                                              // **Atenção:** Se CustomProductExpandedCardWidget tem lógica específica
                                              // de produto além de exibir listas de dados, ele precisará ser adaptado
                                              // ou você precisará criar um widget separado para empresas.
                                              CustomProductExpandedCardWidget(
                                                index: index, // Índice na lista final
                                                itemType: currentItemType, // Passa o tipo de item
                                                onRemove: () => controller.removeRequestedProduct(productItem.productId), // Callback Remover Produto
                                                onEdit: () {
                                                  // TODO: Implementar lógica de edição para produtos
                                                  print('Editar Produto: ${productItem.productName}');
                                                },
                                                firstColumnData: [
                                                  {'title': 'Medida', 'conteudo': 'KG'}, // Placeholder - Obter do productItem
                                                  {'title': 'Segmento', 'conteudo': 'Fertilizantes'}, // Placeholder - Obter do productItem
                                                  {'title': 'Foto de anexo', 'conteudo': 'Foto'}, // Placeholder
                                                ],
                                                secondColumnData: [
                                                  {'title': 'Marca', 'conteudo': 'Heringer'}, // Placeholder - Obter do productItem
                                                  {'title': 'Maquinário vinculado', 'conteudo': 'Maquinário'}, // Placeholder
                                                ],
                                                // listItems provavelmente não é necessário aqui se o card for adaptado
                                              )
                                            ],
                                          ),
                                        );
                                      } else if (currentItemType == ItemType.company) {
                                        // Item de Empresa
                                        final companySelectEntity = selectedItem as SelectEntity; // Cast para SelectEntity

                                        // Obtém os detalhes completos da empresa usando o metodo da controller
                                        final CompanyEntity? companyDetails = controller.getCompanyDetails(companySelectEntity.value);

                                        // Prepara os dados para o card expandido da empresa
                                        final List<Map<String, String>> companyFirstColumnData = [];
                                        final List<Map<String, String>> companySecondColumnData = [];

                                        if (companyDetails != null) {
                                          // Popula as listas com dados da CompanyEntity
                                          companyFirstColumnData.addAll([
                                            {'title': 'Nome', 'conteudo': companyDetails.name ?? 'N/A'},
                                            {'title': 'Endereço', 'conteudo': '${companyDetails.addressStreet ?? ''} - ${companyDetails.addressNumber ?? ''}'}, // Assumindo que CompanyEntity tem 'addressStreet' e 'addressNumber'
                                            {'title': 'Cidade', 'conteudo': companyDetails.addressCity ?? 'N/A'}, // Assumindo que CompanyEntity tem 'addressCity'
                                          ]);
                                          companySecondColumnData.addAll([
                                            // Obtém o nome do segmento usando o ID da CompanyEntity
                                            {'title': 'Segmento', 'conteudo': controller.getCompanySegmentName(companyDetails.id)},
                                            {'title': 'Bairro', 'conteudo': companyDetails.addressNeighborhood ?? 'N/A'}, // Assumindo que CompanyEntity tem 'addressNeighborhood'
                                            // CNPJ já está no tile, mas pode ser repetido aqui se necessário
                                            // {'title': 'CNPJ', 'conteudo': companyDetails.legalDocumentNumber ?? 'N/A'},
                                          ]);
                                          // Adicione outros campos da CompanyEntity conforme necessário
                                        } else {
                                          // Caso os detalhes da empresa não sejam encontrados
                                          companyFirstColumnData.add({'title': 'Detalhes', 'conteudo': 'Detalhes da empresa não encontrados.'});
                                        }


                                        // Obtém o nome do segmento usando o metodo público da controller para o tile
                                        // (Usando o ID do SelectEntity, que deve ser o mesmo da CompanyEntity)
                                        //final String segmentNameForTile = controller.getCompanySegmentName(companySelectEntity.value);


                                        return Theme( // Mantém o Theme para consistência visual
                                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                          child: ExpansionTile( // Mantém ExpansionTile, pode adicionar detalhes da empresa nos children
                                            initiallyExpanded: false,
                                            showTrailingIcon: false,
                                            tilePadding: const EdgeInsets.all(0),
                                            trailing: SizedBox(width: 0.0),
                                            // Usa CustomTwoItemsAlternateColorTileWidget para exibir nome e CNPJ
                                            title: CustomTwoItemsAlternateColorTileWidget(
                                              itemType: currentItemType,
                                              index: index, // Índice na lista final
                                              firstItem: companySelectEntity.label ?? 'Nome da Empresa', // Nome da empresa (do SelectEntity)
                                              secondItem: companyDetails?.legalDocumentNumber ?? 'N/A', // CNPJ para o tile
                                            ),
                                            children: [
                                              // Usa CustomProductExpandedCardWidget (ou um widget adaptado/novo para empresas)
                                              // passando os dados preparados da CompanyEntity
                                              // **Atenção:** Verifique se CustomProductExpandedCardWidget
                                              // pode lidar corretamente com os dados de empresa.
                                              // Se ele tiver lógica específica de produto, você precisará adaptá-lo
                                              // ou criar um CustomCompanyExpandedCardWidget.
                                              CustomProductExpandedCardWidget(
                                                index: index, // Índice na lista final
                                                itemType: currentItemType, // Passa o tipo de item
                                                onRemove: () => controller.removeSelectedCompany(companySelectEntity.value), // Callback Remover Empresa
                                                onEdit: null, // Não passa callback de editar para empresas (conforme requisito)
                                                firstColumnData: companyFirstColumnData, // Dados da empresa
                                                secondColumnData: companySecondColumnData, // Dados da empresa
                                                // Remova ou ajuste listItems, pois é específico de produtos
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      return Container(); // Fallback
                                    },
                                  );
                                } else {
                                  // Mensagem quando a lista final está vazia
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                                    child: Text(
                                      currentItemType == ItemType.product
                                          ? 'Nenhum produto selecionado para a requisição.'
                                          : 'Nenhuma empresa selecionada para a requisição.',
                                      style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        )),
                  ), // Fim do Flexible

                  // Botões de ação (Voltar e Próximo) - Ficam abaixo do Flexible
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              // Volta para a página anterior (geralmente a de informações iniciais)
                              PurchaseRequestCreateGeneralInfoFirstPage.pop();
                              // Decida se o resetState da controller deve ser chamado aqui
                              // controller.resetState(); // Se voltar significa cancelar a criação atual
                            },
                            label: 'Voltar',
                            textColor: AppColors.primaryBlackColor,
                            backgroundColor: AppColors.backgroundColor,
                            borderColor: AppColors.formGreyColor,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CustomElevatedButton(
                            onPressed: () {
                              if (finalItemsList.isEmpty) {
                                CustomSnackBarWidget.show(SnackBarType.alert, context,
                                  currentItemType == ItemType.product
                                      ? 'Selecione pelo menos um produto.'
                                      : 'Selecione pelo menos uma empresa.',
                                );
                              } else {

                                if(currentItemType == ItemType.product){
                                  PurchaseRequestCreateListItemsPage.push(args: ArgParams(firstArgs: ItemType.company));
                                } else {
                                  PurchaseRequestCreatePaymentMethodPage.push();
                                }
                              }
                            },
                            label: 'Próximo',
                            backgroundColor: AppColors.primaryGreenColor,
                            borderColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
