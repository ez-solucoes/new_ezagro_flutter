//[ INSETO, FUNGOS, BACTERIA, VERMES, PLANTAS_DANINHAS ]

enum PestTypeEnum{
 inseto,
  fungos,
  bacteria,
  vermes,
  plantasDaninhas,

}

pestTypeEnum(String pestType){
  switch (pestType) {
    case 'INSETO':
      return PestTypeEnum.inseto;
    case 'FUNGOS':
      return PestTypeEnum.fungos;
      case 'BACTERIA':
      return PestTypeEnum.bacteria;
      case 'VERMES':
      return PestTypeEnum.vermes;
      case 'PLANTAS_DANINHAS':
      return PestTypeEnum.plantasDaninhas;
  }
}

pestTypeString(type) {
  switch (type) {
    case PestTypeEnum.inseto:
      return 'INSETO';
    case PestTypeEnum.fungos:
      return 'FUNGOS';
    case PestTypeEnum.bacteria:
      return 'BACTERIA';
    case PestTypeEnum.vermes:
      return 'VERMES';
    case PestTypeEnum.plantasDaninhas:
      return 'PLANTAS_DANINHAS';
    default:
      return '';
  }
}

