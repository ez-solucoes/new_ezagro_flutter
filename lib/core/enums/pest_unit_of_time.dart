//[ DIAS, SEMANAS ]

enum PestUnitOfTimeEnum{
  dias,
  semanas,
}

pestUnitOfTimeEnum(String pestUnitOfTime) {
  switch (pestUnitOfTime) {
    case 'DIAS':
      return PestUnitOfTimeEnum.dias;
    case 'SEMANAS':
      return PestUnitOfTimeEnum.semanas;
  }
}

pestUnitOfTimeString(type) {
  switch (type) {
    case PestUnitOfTimeEnum.dias:
      return 'DIAS';
    case PestUnitOfTimeEnum.semanas:
      return 'SEMANAS';
    default:
      return '';
  }
}