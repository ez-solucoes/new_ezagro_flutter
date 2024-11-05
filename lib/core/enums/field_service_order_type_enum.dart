enum FieldServiceOrderTypeEnum {
  planting,
  harvesting,
  monitoring,
  spraying,
  transfer,
  generic,
}

FieldServiceOrderTypeEnum getFieldServiceOrderTypeEnum(String type) {
  if (type.contains('pulverizacao')) {
    return FieldServiceOrderTypeEnum.spraying;
  }
  switch (type) {
    case 'plantio':
      return FieldServiceOrderTypeEnum.planting;
    case 'colheita':
      return FieldServiceOrderTypeEnum.harvesting;
    case 'monitoramento':
      return FieldServiceOrderTypeEnum.monitoring;
    case 'transferencia':
      return FieldServiceOrderTypeEnum.transfer;
    default:
      return FieldServiceOrderTypeEnum.generic;
  }
}
