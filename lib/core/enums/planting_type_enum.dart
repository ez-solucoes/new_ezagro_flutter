//PERENNIAL, NON_PERENNIAL

enum PlantingTypeEnum {
  perennial,
  nonPerennial,
}

plantingTypeEnum(String plantingType) {
  switch (plantingType) {
    case 'PERENNIAL':
      return PlantingTypeEnum.perennial;
    case 'NON_PERENNIAL':
      return PlantingTypeEnum.nonPerennial;
  }
}

plantingTypeString(type) {
  switch (type) {
    case PlantingTypeEnum.perennial:
      return 'PERENNIAL';
    case PlantingTypeEnum.nonPerennial:
      return 'NON_PERENNIAL';
    default:
      return '';
  }
}