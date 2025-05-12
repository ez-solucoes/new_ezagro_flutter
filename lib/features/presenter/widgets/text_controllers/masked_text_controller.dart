import 'package:flutter/material.dart';
import 'package:new_ezagro_flutter/core/enums/mask_type_enum.dart';
import 'package:new_ezagro_flutter/core/extensions/unmask_text_field_extension.dart';

class MaskedTextController extends TextEditingController {
  final MaskTypeEnum maskType;

  MaskedTextController(this.maskType) {
    addListener(_maskText);
  }

  void _maskText() {
    String maskedText = _applyMaskTo(text);
    value = value.copyWith(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }

  String _applyMaskTo(String text) {
    switch (maskType) {
      case MaskTypeEnum.cpf:
        return _applyCPFMask(text.toUpperCase());
      case MaskTypeEnum.cep:
        return _applyCEPMask(text.toUpperCase());
      case MaskTypeEnum.cnpj:
        return _applyCNPJMask(text.toUpperCase());
      case MaskTypeEnum.brl:
        return _applyCurrencyMask(
            text.toUpperCase(), maskTypeString(MaskTypeEnum.brl));
      case MaskTypeEnum.usd:
        return _applyCurrencyMask(
            text.toUpperCase(), maskTypeString(MaskTypeEnum.usd));
      }
  }

  String _applyCPFMask(String text) {
    text = text.unmask;
    if (text.length > 3) text = '${text.substring(0, 3)}.${text.substring(3)}';
    if (text.length > 7) text = '${text.substring(0, 7)}.${text.substring(7)}';
    if (text.length > 11) {
      text = '${text.substring(0, 11)}-${text.substring(11)}';
    }
    return text;
  }

  String _applyCEPMask(String text) {
    text = text.unmask;
    if (text.length > 5) text = '${text.substring(0, 5)}-${text.substring(5)}';
    return text;
  }

  String _applyCNPJMask(String text) {
    text = text.unmask;
    if (text.length > 2) text = '${text.substring(0, 3)}.${text.substring(2)}';
    if (text.length > 6) text = '${text.substring(0, 6)}.${text.substring(6)}';
    if (text.length > 10) {
      text = '${text.substring(0, 10)}/${text.substring(10)}';
    }
    if (text.length > 15) {
      text = '${text.substring(0, 15)}-${text.substring(15)}';
    }
    return text;
  }

  String _applyCurrencyMask(String text, String currency) {
    text = text.unmask;
    if (text.isEmpty) return '';

    double value = double.parse(text) / 100;
    if (currency == maskTypeString(MaskTypeEnum.brl)) {
      return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
    } else {
      return '\$${value.toStringAsFixed(2)}';
    }
  }
}
