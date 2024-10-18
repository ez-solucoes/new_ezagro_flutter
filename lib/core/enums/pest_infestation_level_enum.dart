//[NO_RECORD, LOW, ATTENTION, HIGH ]

enum PestInfestationLevelEnum {
  noRecord,
  low,
  attention,
  high,
}

pestInfestationLevelEnum(String type) {
  switch (type) {
    case 'NO_RECORD':
      return PestInfestationLevelEnum.noRecord;
    case 'LOW':
      return PestInfestationLevelEnum.low ;
    case 'ATTENTION':
      return PestInfestationLevelEnum.attention;
    case 'HIGH':
      return PestInfestationLevelEnum.high;
  }
}

pestInfestationLevelString(type) {
  switch (type) {
    case PestInfestationLevelEnum.noRecord:
      return 'NO_RECORD';
    case PestInfestationLevelEnum.low :
      return 'LOW';
    case PestInfestationLevelEnum.attention:
      return 'ATTENTION';
    case PestInfestationLevelEnum.high:
      return 'HIGH';
    default:
      return '';
  }
}