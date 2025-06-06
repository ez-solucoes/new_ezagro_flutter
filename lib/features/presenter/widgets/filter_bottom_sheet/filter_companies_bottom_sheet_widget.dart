import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import '../../../../design_system/colors/app_colors.dart';
import '../../miscellaneous/item_selection_controller.dart';
import '../buttons/custom_elevated_button.dart';

// Enum para definir os tipos de filtro
enum CompanyFilterType { segmento, cidade }

class FilterCompaniesBottomSheetWidget extends StatefulWidget {
  // REMOVIDO: final List<SelectEntity> companySegmentsList;
  // NOVO: Recebe a ItemSelectionController diretamente
  final ItemSelectionController controller;

  const FilterCompaniesBottomSheetWidget({
    super.key,
    required this.controller, // AGORA REQUER A CONTROLLER
  });

  @override
  State<FilterCompaniesBottomSheetWidget> createState() => _FilterCompaniesBottomSheetWidgetState();
}

class _FilterCompaniesBottomSheetWidgetState extends State<FilterCompaniesBottomSheetWidget> {
  // A controller agora é acessada via widget.controller
  // final controller = Modular.get<PurchaseRequestCreateController>(); // REMOVIDO

  // Estado local para o SegmentedButton
  CompanyFilterType _selectedFilterType = CompanyFilterType.segmento;

  @override
  void initState() {
    super.initState();
    // Sincroniza o estado local do SegmentedButton com o filtro ativo na controller
    if (widget.controller.filteredCompanySegmentsListToSelect.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.segmento;
    } else if (widget.controller.cityFilterText.isNotEmpty || widget.controller.stateFilterText.isNotEmpty) {
      _selectedFilterType = CompanyFilterType.cidade;
    } else {
      _selectedFilterType = CompanyFilterType.segmento; // Default se nenhum filtro ativo
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration( // Adicionado const
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.filter_alt_outlined), // Adicionado const
                const SizedBox(width: 10), // Adicionado const
                Text(
                  'Filtrar por',
                  style: TextStyle(color: AppColors.formGreyColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20), // Adicionado const

            Center(
              child: SegmentedButton<CompanyFilterType>(
                segments: const <ButtonSegment<CompanyFilterType>>[ // Adicionado const
                  ButtonSegment<CompanyFilterType>(
                    value: CompanyFilterType.segmento,
                    label: Text('Segmento'),
                  ),
                  ButtonSegment<CompanyFilterType>(
                    value: CompanyFilterType.cidade,
                    label: Text('Cidade'),
                  ),
                ],
                selected: <CompanyFilterType>{_selectedFilterType},
                onSelectionChanged: (Set<CompanyFilterType> newSelection) {
                  setState(() {
                    _selectedFilterType = newSelection.first;
                    if (_selectedFilterType == CompanyFilterType.segmento) {
                      widget.controller.clearSelectedCityFilter(); // USA widget.controller
                    } else {
                      widget.controller.clearSelectedCompanySegments(); // USA widget.controller
                    }
                  });
                },
                style: SegmentedButton.styleFrom(
                  selectedBackgroundColor: AppColors.primaryGreenColor,
                  selectedForegroundColor: AppColors.primaryWhiteColor,
                  foregroundColor: AppColors.primaryBlackColor,
                  side: const BorderSide(color: AppColors.formGreyColor), // Adicionado const
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            const SizedBox(height: 20), // Adicionado const

            if (_selectedFilterType == CompanyFilterType.segmento) ...[
              Text(
                'Segmento:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              const SizedBox(height: 10), // Adicionado const
              Observer(
                builder: (_) {
                  // Usar a lista de segmentos selecionados da controller para determinar o estado do checkbox
                  final Set<int> selectedSegmentsFromController =
                  widget.controller.filteredCompanySegmentsListToSelect.map((s) => s.value).toSet(); // USA widget.controller

                  // Removido Expanded para evitar erro de layout em Column com mainAxisSize.min
                  return SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      // Usa widget.controller.companySegmentsListToSelect para a lista de opções
                      children: widget.controller.companySegmentsListToSelect.map((companySegment) { // USA widget.controller
                        final isSelected = selectedSegmentsFromController.contains(companySegment.value);
                        return GestureDetector(
                          onTap: () {
                            final Set<int> updatedSelectedIds = Set<int>.from(selectedSegmentsFromController);
                            if (updatedSelectedIds.contains(companySegment.value)) {
                              updatedSelectedIds.remove(companySegment.value);
                            } else {
                              updatedSelectedIds.add(companySegment.value);
                            }
                            widget.controller.updateSelectedCompanySegments(updatedSelectedIds); // USA widget.controller
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Adicionado const
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
                                  const SizedBox(width: 5), // Adicionado const
                                  const Icon( // Adicionado const
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
                  );
                },
              ),
            ] else if (_selectedFilterType == CompanyFilterType.cidade) ...[
              Text(
                'Estado:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              const SizedBox(height: 10), // Adicionado const
              Autocomplete<String>(
                initialValue: TextEditingValue(text: widget.controller.stateFilterText), // USA widget.controller
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return widget.controller.getUniqueStates(); // USA widget.controller
                  }
                  return widget.controller.getUniqueStates().where((String state) { // USA widget.controller
                    return state.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  widget.controller.updateStateFilter(selection); // USA widget.controller
                },
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome do estado',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.formGreyColor), // Adicionado const
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.formGreyColor), // Adicionado const
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.primaryGreenColor, width: 2), // Adicionado const
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15), // Adicionado const
                    ),
                    onChanged: (text) {
                      widget.controller.updateStateFilter(text); // USA widget.controller
                    },
                    onSubmitted: (text) {
                      // widget.controller.applyCompanyFilters(); // Opcional: aplicar filtro ao submeter
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0), // Adicionado const
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
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
              const SizedBox(height: 20), // Adicionado const

              Text(
                'Cidade:',
                style: TextStyle(color: AppColors.primaryBlackColor, fontSize: 14),
              ),
              const SizedBox(height: 10), // Adicionado const
              Autocomplete<String>(
                initialValue: TextEditingValue(text: widget.controller.cityFilterText), // USA widget.controller
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return widget.controller.getUniqueCities(state: widget.controller.stateFilterText); // USA widget.controller
                  }
                  return widget.controller.getUniqueCities(state: widget.controller.stateFilterText).where((String city) { // USA widget.controller
                    return city.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  widget.controller.updateCityFilter(selection); // USA widget.controller
                },
                fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Digite o nome da cidade',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.formGreyColor), // Adicionado const
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.formGreyColor), // Adicionado const
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: AppColors.primaryGreenColor, width: 2), // Adicionado const
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15), // Adicionado const
                    ),
                    onChanged: (text) {
                      widget.controller.updateCityFilter(text); // USA widget.controller
                    },
                    onSubmitted: (text) {
                      // widget.controller.applyCompanyFilters(); // Opcional: aplicar filtro ao submeter
                    },
                  );
                },
                optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8.0), // Adicionado const
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String option = options.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
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

            const SizedBox(height: 20), // Adicionado const

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (_selectedFilterType == CompanyFilterType.segmento) {
                          widget.controller.clearSelectedCompanySegments(); // USA widget.controller
                        } else if (_selectedFilterType == CompanyFilterType.cidade) {
                          widget.controller.clearSelectedCityFilter(); // USA widget.controller
                        }
                      },
                      label: 'Limpar Filtros',
                      textColor: AppColors.primaryBlackColor,
                      backgroundColor: AppColors.backgroundColor,
                      borderColor: AppColors.formGreyColor,
                    ),
                  ),
                  const SizedBox(width: 30), // Adicionado const
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        widget.controller.applyCompanyFilters(); // USA widget.controller
                        Navigator.pop(context);
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