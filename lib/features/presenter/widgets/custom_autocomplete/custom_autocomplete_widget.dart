import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../design_system/colors/app_colors.dart';

enum AutoCompleteType {
  simple,
  outlined,
}

class CustomAutocompleteWidget extends StatefulWidget {
  final List<SelectEntity> itemList;
  final ValueChanged<SelectEntity> onItemSelected;
  final String hintText;
  final AutoCompleteType autoCompleteType;
  final SelectEntity? initialValue;

  const CustomAutocompleteWidget({
    super.key,
    required this.itemList,
    required this.onItemSelected,
    this.hintText = 'Pesquisar',
    required this.autoCompleteType,
    this.initialValue,
  });

  @override
  State<CustomAutocompleteWidget> createState() => _CustomAutocompleteWidgetState();
}

class _CustomAutocompleteWidgetState extends State<CustomAutocompleteWidget> {
  // Este controlador será usado para gerenciar o texto exibido no campo
  late TextEditingController _internalTextEditingController;
  // Este FocusNode será usado para gerenciar o foco do campo
  late FocusNode _internalFocusNode;

  @override
  void initState() {
    super.initState();
    // Inicializa o controlador com o valor inicial fornecido
    _internalTextEditingController = TextEditingController(text: widget.initialValue?.label ?? '');
    _internalFocusNode = FocusNode();

    // Adiciona um listener para atualizar o texto do controlador quando o usuário digita
    _internalTextEditingController.addListener(() {
      // Quando o texto digitado é limpo pelo usuário, podemos considerar que a seleção foi desfeita
      // ou que ele está digitando uma nova pesquisa.
      // Não precisamos fazer nada aqui para o problema atual de dropdown.
    });
  }

  @override
  void didUpdateWidget(covariant CustomAutocompleteWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Se o valor inicial do widget pai mudar, atualiza o texto do controlador interno.
    // Isso é crucial para que o campo exiba o valor selecionado vindo de fora.
    if (widget.initialValue != oldWidget.initialValue) {
      _internalTextEditingController.text = widget.initialValue?.label ?? '';
    }
  }

  @override
  void dispose() {
    _internalTextEditingController.dispose();
    _internalFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<SelectEntity>(
      displayStringForOption: (SelectEntity option) => option.label ?? '',
      optionsBuilder: (TextEditingValue textEditingValue) {
        // Se o campo de texto estiver vazio, mostra todos os itens.
        if (textEditingValue.text.isEmpty) {
          return widget.itemList;
        }
        // Filtra os itens com base no texto digitado.
        return widget.itemList.where((entity) {
          return entity.label?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
        });
      },
      onSelected: (SelectEntity selectedOption) {
        // Quando um item é selecionado, atualiza o texto do controlador interno
        // para exibir o item selecionado.
        _internalTextEditingController.text = selectedOption.label ?? '';
        // Chama o callback onItemSelected do widget pai para notificar a seleção.
        widget.onItemSelected(selectedOption);
        // Não chame requestFocus() ou unfocus() aqui.
        // O RawAutocomplete deve gerenciar o foco e o fechamento do dropdown.
      },
      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        // É CRUCIAL usar o fieldTextEditingController e focusNode fornecidos pelo RawAutocomplete
        // para que ele possa gerenciar corretamente o dropdown e o foco.
        // Copiamos o texto do nosso controlador interno para o controlador do RawAutocomplete.
        fieldTextEditingController.text = _internalTextEditingController.text;

        return TextField(
            controller: fieldTextEditingController, // Usa o controlador fornecido pelo RawAutocomplete
            focusNode: focusNode, // Usa o FocusNode fornecido pelo RawAutocomplete
            cursorColor: AppColors.formGreyColor,
            decoration: _buildInputDecoration(widget.hintText, widget.autoCompleteType));
      },
      optionsViewBuilder:
          (BuildContext context, void Function(SelectEntity) onSelected, Iterable<SelectEntity> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final SelectEntity option = options.elementAt(index);
                  return ListTile(
                    title: Text(option.label ?? ''),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _buildInputDecoration(String hintText, AutoCompleteType autoCompleteType) {
    switch (autoCompleteType) {
      case AutoCompleteType.outlined:
        return InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.formGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.formGreyColor),
            ));
      case AutoCompleteType.simple:
        return InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.formGreyColor),
          hintStyle: TextStyle(color: AppColors.formGreyColor),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.formGreyColor)
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.formGreyColor)
          ),
        );
    }
  }
}
