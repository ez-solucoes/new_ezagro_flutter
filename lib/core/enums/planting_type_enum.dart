//PERENE, NAO_PERENE

enum PlantingTypeEnum {
  perene,
  naoPerene,
}

plantingTypeEnum(String plantingType) {
  switch (plantingType) {
    case 'PERENE':
      return PlantingTypeEnum.perene;
    case 'NAO_PERENE':
      return PlantingTypeEnum.naoPerene;
  }
}

plantingTypeString(type) {
  switch (type) {
    case PlantingTypeEnum.perene:
      return 'PERENE';
    case PlantingTypeEnum.naoPerene:
      return 'NAO_PERENE';
    default:
      return '';
  }
}
