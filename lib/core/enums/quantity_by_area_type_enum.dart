// [ METRO_LINEAR, HECTARES, POR_AMOSTRAGEM ]

enum QuantityByAreaTypeEnum {
  metroLinear,
  hectares,
  porAmostragem,
}

quantityByAreaTypeEnum(String quantityByAreaType) {
  switch (quantityByAreaType) {
    case 'METRO_LINEAR':
      return QuantityByAreaTypeEnum.metroLinear;
    case 'HECTARES':
      return QuantityByAreaTypeEnum.hectares;
    case 'POR_AMOSTRAGEM':
      return QuantityByAreaTypeEnum.porAmostragem;
  }
}

quantityByAreaTypeString(type) {
  switch (type) {
    case QuantityByAreaTypeEnum.metroLinear:
      return 'METRO_LINEAR';
    case QuantityByAreaTypeEnum.hectares:
      return 'HECTARES';
    case QuantityByAreaTypeEnum.porAmostragem:
      return 'POR_AMOSTRAGEM';
    default:
      return '';
  }
}
