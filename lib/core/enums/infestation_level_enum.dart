
//[ SEM_REGISTRO, BAIXO, ATENCAO, ALTO ]

enum InfestationLevelEnum {
  semRegistro,
  baixo,
  atencao,
  alto,
}

infestationLevelEnum(String infestationLevel) {
  switch (infestationLevel) {
    case 'SEM_REGISTRO':
      return InfestationLevelEnum.semRegistro;
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
    case InfestationLevelEnum.semRegistro:
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
