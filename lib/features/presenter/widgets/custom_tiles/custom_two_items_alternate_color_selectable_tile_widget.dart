import 'package:flutter/material.dart';

import '../../../../design_system/colors/app_colors.dart';
import '../../../../design_system/typography/app_text_styles.dart';

// Definindo o tipo do callback para o onChanged do checkbox
typedef SelectableItemCallback = void Function(bool isSelected);

class CustomTwoItemsAlternateColorSelectableTileWidget extends StatefulWidget {
  final String firstLabel; // Nome da Empresa
  final String secondLabel; // Segmento da Empresa
  final bool initialIsSelected; // Valor inicial do checkbox
  final SelectableItemCallback onChanged; // Callback quando o checkbox muda

  const CustomTwoItemsAlternateColorSelectableTileWidget({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.initialIsSelected,
    required this.onChanged,
  });

  @override
  State<CustomTwoItemsAlternateColorSelectableTileWidget> createState() => _CustomTwoItemsAlternateColorSelectableTileWidgetState();
}

class _CustomTwoItemsAlternateColorSelectableTileWidgetState extends State<CustomTwoItemsAlternateColorSelectableTileWidget> {
  late bool _isChecked; // Estado interno do checkbox

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialIsSelected; // Inicializa o estado com o valor passado
  }

  // Atualiza o estado interno se o valor inicial mudar (ex: lista filtrada recarrega)
  @override
  void didUpdateWidget(covariant CustomTwoItemsAlternateColorSelectableTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIsSelected != oldWidget.initialIsSelected) {
      _isChecked = widget.initialIsSelected;
    }
  }


  @override
  Widget build(BuildContext context) {
    // Usar um Container ou GestureDetector para tornar a linha inteira clicável para o checkbox
    return GestureDetector(
      onTap: () {
        // Alterna o estado interno e chama o callback
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(_isChecked); // Chama o callback com o novo estado
      },
      child: Container( // Envolve com Container para dar padding ou margem se necessário
        padding: const EdgeInsets.symmetric(vertical: 8.0), // Exemplo de padding
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                widget.firstLabel, // Usa o valor do widget
                style:AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                // overflow: TextOverflow.ellipsis, // Evita overflow de texto longo
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.secondLabel, // Usa o valor do widget
                style: AppTextStyles.cardBodyTextStyle(color: AppColors.primaryBlackColor),
                overflow: TextOverflow.ellipsis, // Evita overflow de texto longo
              ),
            ),
            Expanded(
              flex: 1,
              child: Align( // Alinha o checkbox à direita no Expanded
                alignment: Alignment.centerRight,
                child: Checkbox(
                  value: _isChecked, // Usa o estado interno
                  onChanged: (bool? newValue) {
                    // O onChanged do Checkbox também pode ser usado, mas o GestureDetector na linha inteira é mais amigável
                    // Se usar apenas o onChanged do Checkbox, remova o GestureDetector externo.
                    // Com o GestureDetector, o onChanged do Checkbox pode ser null ou apenas chamar o mesmo callback.
                    if (newValue != null) {
                      setState(() {
                        _isChecked = newValue;
                      });
                      widget.onChanged(newValue); // Chama o callback
                    }
                  },
                  activeColor: AppColors.primaryGreenColor, // Cor do checkbox quando selecionado
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
