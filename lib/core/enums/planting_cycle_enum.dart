//SUPERPRECOCE, PRECOCE, MEDIA, TARDIA

enum PlantingCycleEnum {
  superPrecoce,
  precoce,
  media,
  tardia,
}

plantingCycleEnum(String plantingCycle) {
  switch (plantingCycle) {
    case 'SUPERPRECOCE':
      return PlantingCycleEnum.superPrecoce;
    case 'PRECOCE':
      return PlantingCycleEnum.precoce;
    case 'MEDIA':
      return PlantingCycleEnum.media;
    case 'TARDIA':
      return PlantingCycleEnum.tardia;
  }
}

plantingCycleString(type) {
  switch (type) {
    case PlantingCycleEnum.superPrecoce:
      return 'SUPERPRECOCE';
    case PlantingCycleEnum.precoce:
      return 'PRECOCE';
    case PlantingCycleEnum.media:
      return 'MEDIA';
    case PlantingCycleEnum.tardia:
      return 'TARDIA';
    default:
      return '';
  }
}
