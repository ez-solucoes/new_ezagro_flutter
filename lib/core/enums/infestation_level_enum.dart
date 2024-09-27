//[ SEM_REGISTRO, BAIXO, ATENCAO, ALTO ]

enum InfestationLevelEnum {
  sem_registro,
  baixo,
  atencao,
  alto,
}

infestationLevelEnum(String infestationLevel) {
  switch (infestationLevel) {
    case 'SEM_REGISTRO':
      return InfestationLevelEnum.sem_registro;
    case 'BAIXO':
      return InfestationLevelEnum.baixo;
    case 'ATENCAO':
      return InfestationLevelEnum.atencao;
    case 'ALTO':
      return InfestationLevelEnum.alto;
  }
}

infestationLevelString(type) {
  switch (type) {
    case InfestationLevelEnum.sem_registro:
      return 'SEM_REGISTRO';
    case InfestationLevelEnum.baixo:
      return 'BAIXO';
    case InfestationLevelEnum.atencao:
      return 'ATENCAO';
    case InfestationLevelEnum.alto:
      return 'ALTO';
    default:
      return '';
  }
}
