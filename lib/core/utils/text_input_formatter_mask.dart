import 'package:flutter/services.dart';

import '../enums/mask_type_enum.dart';

class TextInputFormatterMask extends TextInputFormatter {
  final String? firstSeparator;
  final String? secondSeparator;
  final String? thirdSeparator;
  final String mask;

  TextInputFormatterMask({
    this.firstSeparator,
    required this.mask,
    this.secondSeparator,
    this.thirdSeparator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    dynamic type = maskType(mask);
    List<String> separators = maskSeparators(mask);
    String charTypeMask = maskString(type);

    if (newValue.text.length > oldValue.text.length) {
      for (int i = 0; i < separators.length; i++) {
        if (newValue.text.length < charTypeMask.length &&
            charTypeMask[newValue.text.length - 1] == separators[i]) {
          return TextEditingValue(
            text:
                '${oldValue.text}${separators[i]}${newValue.text.substring(newValue.text.length - 1)}',
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }

      if (newValue.text.length > charTypeMask.length) {
        return oldValue;
      }
    }

    return newValue;
  }

  List<String> maskSeparators(String type) {
    switch (maskType(type)) {
      case MaskTypeEnum.cpf:
        return ['.', '.', '-'];
      case MaskTypeEnum.cnpj:
        return ['.', '.', '/', '-'];
      case MaskTypeEnum.cep:
        return ['-'];
      default:
        return [];
    }
  }

  MaskTypeEnum maskType(String type) {
    switch (type) {
      case 'CPF':
        return MaskTypeEnum.cpf;
      case 'CNPJ':
        return MaskTypeEnum.cnpj;
      case 'CEP':
        return MaskTypeEnum.cep;
      default:
        throw Exception('Tipo de máscara desconhecido');
    }
  }

  String maskString(MaskTypeEnum type) {
    switch (type) {
      case MaskTypeEnum.cpf:
        return '000.000.000-00';
      case MaskTypeEnum.cnpj:
        return '00.000.000/0000-00';
      case MaskTypeEnum.cep:
        return '00000-000';
      default:
        return '';
    }
  }
}
