enum FieldServiceOrderTypeEnum {
  planting,
  harvesting,
  monitoring,
  spraying,
  transfer,
  generic,
}

FieldServiceOrderTypeEnum getFieldServiceOrderTypeEnum(String type) {
  if (type.contains('Pulverização')) {
    return FieldServiceOrderTypeEnum.spraying;
  }
  switch (type) {
    case 'Plantio':
      return FieldServiceOrderTypeEnum.planting;
    case 'Colheita':
      return FieldServiceOrderTypeEnum.harvesting;
    case 'Monitoramento':
      return FieldServiceOrderTypeEnum.monitoring;
    case 'Transferência':
      return FieldServiceOrderTypeEnum.transfer;
    default:
      return FieldServiceOrderTypeEnum.generic;
  }
}