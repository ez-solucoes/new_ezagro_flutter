import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../design_system/colors/app_colors.dart';

enum AutoCompleteType {
  simple,
  outlined,
}

class CustomAutocompleteWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final focusNode = FocusNode();

    return RawAutocomplete<SelectEntity>(
        displayStringForOption: (SelectEntity option) => option.label ?? '',
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return itemList;
          }
          return itemList.where((entity) {
            return entity.label?.toLowerCase().contains(textEditingValue.text.toLowerCase()) ?? false;
          });
        },
        onSelected: (SelectEntity selectedOption){
          textEditingController.clear();
          focusNode.requestFocus();
          onItemSelected(selectedOption);
        },
        initialValue: initialValue != null
        ? TextEditingValue(text: initialValue!.label ?? '')
        : null,
        fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          fieldTextEditingController.text = textEditingController.text;
          return TextField(
              controller: fieldTextEditingController,
              focusNode: focusNode,
              cursorColor: AppColors.formGreyColor,
              decoration: _buildInputDecoration(hintText, autoCompleteType));
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
        });
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
