import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Importar Observer para reagir a mudanças na controller
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_ezagro_flutter/features/presenter/modules/purchase_request/purchase_request_create/purchase_request_create_controller.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../domain/entities/select_entities/select_entity.dart';
import '../buttons/custom_elevated_button.dart';
// Importar para usar o metodo toggle em Set


// Enum para definir os tipos de filtro
enum CompanyFilterType { segmento, cidade } // Mantido, mas 'cidade' agora implica cidade E estado

class FilterCompaniesBottomSheetWidget extends StatefulWidget {
  final List<SelectEntity> companySegmentsList;
  // Você precisará passar a lista de cidades selecionáveis ou apenas o campo de texto livre
  // Se for campo de texto livre, não precisa de uma lista aqui.
  // final List<SelectEntity> citiesList; // Exemplo se fosse uma lista de cidades

  const FilterCompaniesBottomSheetWidget({
    super.key,
    required this.companySegmentsList,
    // this.citiesList, // Exemplo
  });

  @override
  State<FilterCompaniesBottomSheetWidget> createState() => _FilterCompaniesBottomSheetWidgetState();
}

class _FilterCompaniesBottomSheetWidgetState extends State<FilterCompaniesBottomSheetWidget> {
  // Usaremos a controller para gerenciar o estado dos filtros de segmento, cidade e estado
  final controller = Modular.get<PurchaseRequestCreateController>();

  // Controllers locais para os TextFields de cidade e estado (para gerenciar o texto digitado)
  // Inicializamos com os valores da controller para manter o estado ao reabrir o bottom sheet
  // Não precisamos mais de TextEditingControllers locais para Autocomplete
  // final TextEditingController _cityFilterController = TextEditingController();
  // final TextEditingController _stateFilterController = TextEditingController();

  // Estado local para o SegmentedButton
  CompanyFilterType _selectedFilterType = CompanyFilterType.segmento;

  @override
  void initState() {
    super.initState();
    // Inicializa os TextFields com os valores atuais da controller, se existirem
    // Não precisamos mais inicializar TextEditingControllers locais para Autocomplete
    // _cityFilterController.text = controller.cityFilterText;
    // _stateFilterController.text = controller.stateFilterText;

    // Sincroniza o estado local do SegmentedButton com o filtro ativo na controller, se houver
    // Se houver segmentos selecionados, o filtro ativo é segmento.
    // Caso contrário, se houver texto nos filtros de cidade ou estado, o filtro ativo é cidade.
    // Se nenhum filtro estiver ativo, o padrão é segmento.
    if (controller.filteredCompanySegmentsListToSelect.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.segmento;
    } else if (controller.cityFilterText.isNotEmpty || controller.stateFilterText.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.cidade; // 'cidade' implica filtro por cidade/estado
    } else {
      _selectedFilterType = CompanyFilterType.segmento; // Default se nenhum filtro ativo
    }
  }


  @override
  void dispose() {
    // Não precisamos mais dar dispose em TextEditingControllers locais para Autocomplete
    // _cityFilterController.dispose(); // Dispose do controller do TextField
    // _stateFilterController.dispose(); // Dispose do controller do TextField de estado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use mainAxisSize.min para o BottomSheet
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhar conteúdo à esquerda
          children: [
            Row(
              children: [
                Icon(Icons.filter_alt_outlined),
                const SizedBox(width: 10),
                Text(
                  'Filtrar por',
                  style: TextStyle(color: AppColors.formGreyColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),

            // SegmentedButton para escolher o tipo de filtro
            Center( // Centraliza o SegmentedButton
              child: SegmentedButton<CompanyFilterType>(
                segments: const <ButtonSegment<CompanyFilterType>>[
                  ButtonSegment<CompanyFilterType>(
                    value: CompanyFilterType.segmento,
                    label: Text('Segmento'),
                  ),
                  ButtonSegment<CompanyFilterType>(
                    value: CompanyFilterType.cidade,
                    label: Text('Cidade'), // Atualizado o label
                  ),
                ],
                selected: <CompanyFilterType>{_selectedFilterType},
                onSelectionChanged: (Set<CompanyFilterType> newSelection) {
                  setState(() {
                    _selectedFilterType = newSelection.first;
                    // Limpar filtros do outro tipo ao trocar (usando actions da controller)
                    if (_selectedFilterType == CompanyFilterType.segmento) {
                      controller.clearSelectedCityFilter(); // Limpa o filtro de cidade/estado na controller
                      // Não precisamos limpar TextFields locais para Autocomplete
                      // _cityFilterController.clear();
                      // _stateFilterController.clear();
                    } else { // Selecionou Cidade/Estado
                      controller.clearSelectedCompanySegments(); // Limpa os segmentos selecionados na controller
                    }
                  });
                },
                // Adicione estilos conforme necessário para combinar com seu design system
                style: SegmentedButton.styleFrom(
                  selectedBackgroundColor: AppColors.primaryGreenColor,
                  selectedForegroundColor: AppColors.primaryWhiteColor,
                  foregroundColor: AppColors.primaryBlackColor,
                  side: BorderSide(color: AppColors.formGreyColor),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Conteúdo do filtro condicional
            if (_selectedFilterType == CompanyFilterType.segmento) ...[
              Text(
                'Segmento:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              SizedBox(height: 10),
              // Use Expanded e SingleChildScrollView para o Wrap para evitar overflow
              // Observer para reagir a mudanças na lista de segmentos selecionados da controller
              Observer(
                builder: (_) {
                  // Usar a lista de segmentos selecionados da controller para determinar o estado do checkbox
                  final Set<int> selectedSegmentsFromController =
                  controller.filteredCompanySegmentsListToSelect.map((s) => s.value).toSet();

                  return Expanded( // Adicionado Expanded para o Wrap dentro do Segmento
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 5,
                        children: widget.companySegmentsList.map((companySegment) {
                          final isSelected = selectedSegmentsFromController.contains(companySegment.value);
                          return GestureDetector(
                            onTap: () {
                              // Cria um novo Set com os IDs selecionados atualmente na controller
                              final Set<int> updatedSelectedIds = Set<int>.from(selectedSegmentsFromController);

                              // --- Substituição da lógica toggle ---
                              if (updatedSelectedIds.contains(companySegment.value)) {
                                // Se já estiver selecionado, remove
                                updatedSelectedIds.remove(companySegment.value);
                              } else {
                                // Se não estiver selecionado, adiciona
                                updatedSelectedIds.add(companySegment.value);
                              }
                              // --- Fim da substituição ---

                              // Chama a action na controller para atualizar a seleção de segmentos
                              controller.updateSelectedCompanySegments(updatedSelectedIds);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                  color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(color: AppColors.formGreyColor, width: 1)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    companySegment.label ?? 'Sem Label',
                                    style: TextStyle(
                                      color: isSelected ? AppColors.primaryWhiteColor : AppColors.primaryBlackColor,
                                    ),
                                  ),
                                  if (isSelected) ...[
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.close,
                                      color: AppColors.primaryWhiteColor,
                                      size: 18,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ] else if (_selectedFilterType == CompanyFilterType.cidade) ...[
              // Filtro por Estado (Autocomplete)
              Text(
                'Estado:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              SizedBox(height: 10),
              Autocomplete<String>(
                // Define o texto inicial do campo com o valor da controller
                initialValue: TextEditingValue(text: controller.stateFilterText),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  // Se o texto estiver vazio, retorna todos os estados únicos
                  if (textEditingValue.text.isEmpty) {
                    return controller.getUniqueStates(); // Metodo na controller para obter estados únicos
                  }
                  // Filtra os estados únicos com base no texto digitado (case-insensitive)
                  return controller.getUniqueStates().where((String state) {
                    return state.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  // Atualiza o filtro de estado na controller quando uma sugestão é selecionada
                  controller.updateStateFilter(selection);
                  // Opcional: Aplicar filtro imediatamente após selecionar
                  // controller.applyCompanyFilters();
                },
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  // Usa um TextField para a visualização do campo
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome do estado',
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
                    // Atualiza o estado da controller em tempo real ao digitar
                    onChanged: (text) {
                      controller.updateStateFilter(text);
                      // Opcional: Aplicar filtro em tempo real
                      // controller.applyCompanyFilters();
                    },
                    onSubmitted: (text) {
                      // Opcional: Aplicar filtro ao submeter (pressionar Enter)
                      // controller.applyCompanyFilters();
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  // Constrói a visualização das opções de sugestão
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0, // Altura fixa para o dropdown
                        child: ListView.builder(
                          padding: EdgeInsets.all(8.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option); // Chama o callback onSelected do Autocomplete
                              },
                              child: ListTile(
                                title: Text(option),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20), // Espaço entre Estado e Cidade

              // Filtro por Cidade (Autocomplete)
              Text(
                'Cidade:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              SizedBox(height: 10),
              Autocomplete<String>(
                // Define o texto inicial do campo com o valor da controller
                initialValue: TextEditingValue(text: controller.cityFilterText),
                optionsBuilder: (TextEditingValue textEditingValue) {
                  // Se o texto estiver vazio, retorna todas as cidades únicas
                  if (textEditingValue.text.isEmpty) {
                    // Opcional: Filtrar cidades por estado selecionado, se houver
                    return controller.getUniqueCities(state: controller.stateFilterText); // Metodo na controller para obter cidades únicas (opcionalmente filtrado por estado)
                  }
                  // Filtra as cidades únicas com base no texto digitado (case-insensitive)
                  // Opcional: Filtrar cidades por estado selecionado, se houver
                  return controller.getUniqueCities(state: controller.stateFilterText).where((String city) {
                    return city.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  // Atualiza o filtro de cidade na controller quando uma sugestão é selecionada
                  controller.updateCityFilter(selection);
                  // Opcional: Aplicar filtro imediatamente após selecionar
                  // controller.applyCompanyFilters();
                },
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  // Usa um TextField para a visualização do campo
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome da cidade',
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
                    // Atualiza o estado da controller em tempo real ao digitar
                    onChanged: (text) {
                      controller.updateCityFilter(text);
                      // Opcional: Aplicar filtro em tempo real
                      // controller.applyCompanyFilters();
                    },
                    onSubmitted: (text) {
                      // Opcional: Aplicar filtro ao submeter (pressionar Enter)
                      // controller.applyCompanyFilters();
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  // Constrói a visualização das opções de sugestão
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0, // Altura fixa para o dropdown
                        child: ListView.builder(
                          padding: EdgeInsets.all(8.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option); // Chama o callback onSelected do Autocomplete
                              },
                              child: ListTile(
                                title: Text(option),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],

            SizedBox(height: 20), // Espaço antes dos botões

            // Botões de ação
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        // Limpar o filtro ativo (usando actions da controller)
                        if (_selectedFilterType == CompanyFilterType.segmento) {
                          controller.clearSelectedCompanySegments(); // Limpa segmentos na controller
                        } else if (_selectedFilterType == CompanyFilterType.cidade) {
                          controller.clearSelectedCityFilter(); // Limpa cidade e estado na controller
                          // Não precisamos limpar TextFields locais para Autocomplete
                          // _cityFilterController.clear();
                          // _stateFilterController.clear();
                        }
                        // Não fechamos o bottom sheet automaticamente após limpar,
                        // para permitir que o usuário aplique o filtro limpo.
                      },
                      label: 'Limpar Filtros',
                      textColor: AppColors.primaryBlackColor,
                      backgroundColor: AppColors.backgroundColor,
                      borderColor: AppColors.formGreyColor,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        // Aplicar o filtro ativo. Como os onChanged dos Autocomplete
                        // já chamam actions na controller que atualizam os filtros,
                        // o botão "Aplicar" aqui serve principalmente para fechar o bottom sheet.
                        // Se o filtro não for em tempo real, você chamaria a action
                        // de aplicar filtro aqui.

                        // Se você optou por filtrar apenas ao clicar em "Aplicar",
                        // chame applyCompanyFilters() aqui:
                        controller.applyCompanyFilters(); // Chame se o filtro não for em tempo real

                        Navigator.pop(context); // Fechar o bottom sheet
                      },
                      label: 'Aplicar',
                      backgroundColor: AppColors.primaryGreenColor,
                      borderColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
