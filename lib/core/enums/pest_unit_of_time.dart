//[ DAYS, WEEKS ]

enum PestUnitOfTimeEnum{
  days,
  weeks,
}

pestUnitOfTimeEnum(String pestUnitOfTime) {
  switch (pestUnitOfTime) {
    case 'DAYS':
      return PestUnitOfTimeEnum.days;
    case 'WEEKS':
      return PestUnitOfTimeEnum.weeks;
  }
}

pestUnitOfTimeString(type) {
  switch (type) {
    case PestUnitOfTimeEnum.days:
      return 'DAYS';
    case PestUnitOfTimeEnum.weeks:
      return 'WEEKS';
    default:
      return '';
  }
}