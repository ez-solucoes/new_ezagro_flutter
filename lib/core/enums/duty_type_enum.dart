// [ EMPLOYMENT, FINANCIAL, GENERAL ]

enum DutyTypeEnum {
  employment,
  financial,
  general,
}

dutyTypeEnum(String dutyType) {
  switch (dutyType) {
    case 'EMPLOYMENT':
      return DutyTypeEnum.employment;
    case 'FINANCIAL':
      return DutyTypeEnum.financial;
    case 'GENERAL':
      return DutyTypeEnum.general;
  }
}

dutyTypeString(type) {
  switch (type) {
    case DutyTypeEnum.employment:
      return 'EMPLOYMENT';
    case DutyTypeEnum.financial:
      return 'FINANCIAL';
    case DutyTypeEnum.general:
      return 'GENERAL';
    default:
      return '';
  }
}
