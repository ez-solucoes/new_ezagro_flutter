//[ INSECT, FUNGI, BACTERIA, WORMS, WEEDS, MITE, NEMATODE, VIRUS ]

enum PestTypeEnum {
  insect,
  fungi,
  bacteria,
  worms,
  weeds,
  mite,
  nematode,
  virus
}

pestTypeEnum(String pestType) {
  switch (pestType) {
    case 'INSECT':
      return PestTypeEnum.insect;
    case 'FUNGI':
      return PestTypeEnum.fungi;
    case 'BACTERIA':
      return PestTypeEnum.bacteria;
    case 'WORMS':
      return PestTypeEnum.worms;
    case 'WEEDS':
      return PestTypeEnum.weeds;
    case 'MITE':
      return PestTypeEnum.mite;
    case 'NEMATODE':
      return PestTypeEnum.nematode;
    case 'VIRUS':
      return PestTypeEnum.virus;
  }
}

pestTypeString(type) {
  switch (type) {
    case PestTypeEnum.insect:
      return 'INSECT';
    case PestTypeEnum.fungi:
      return 'FUNGI';
    case PestTypeEnum.bacteria:
      return 'BACTERIA';
    case PestTypeEnum.worms:
      return 'WORMS';
    case PestTypeEnum.weeds:
      return 'WEEDS';
    case PestTypeEnum.mite:
      return 'MITE';
    case PestTypeEnum.nematode:
      return 'NEMATODE';
    case PestTypeEnum.virus:
      return 'VIRUS';
    default:
      return '';
  }
}
