//[LINEAR_METER, HECTARES, BY_SAMPLING ]

enum PestQuantityByAreaTypeEnum {
  linearMeter,
  hectares,
  bySampling,
}

pestQuantityByAreaTypeEnum(String type) {
  switch (type) {
    case 'NO_RECORD':
      return PestQuantityByAreaTypeEnum.linearMeter;
    case 'LOW':
      return PestQuantityByAreaTypeEnum.hectares ;
    case 'ATTENTION':
      return PestQuantityByAreaTypeEnum.bySampling;
  }
}

pestQuantityByAreaTypeString(type) {
  switch (type) {
    case PestQuantityByAreaTypeEnum.linearMeter:
      return 'NO_RECORD';
    case PestQuantityByAreaTypeEnum.hectares :
      return 'LOW';
    case PestQuantityByAreaTypeEnum.bySampling:
      return 'ATTENTION';
    default:
      return '';
  }
}