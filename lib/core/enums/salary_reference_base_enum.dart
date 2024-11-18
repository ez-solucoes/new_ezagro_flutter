//[ FREE_VALUE, PERCENTAGE_OF_BASE_SALARY, PERCENTAGE_OF_MINIMUM_WAGE, PERCENTAGE_OF_COMPOSITION ]

enum SalaryReferenceBaseEnum {
  freeValue,
  percentageOfBaseSalary,
  percentageOfMinimumWage,
  percentageOfComposition,
}

salaryReferenceBaseEnum(String salaryReferenceBase) {
  switch (salaryReferenceBase) {
    case 'FREE_VALUE':
      return SalaryReferenceBaseEnum.freeValue;
    case 'PERCENTAGE_OF_BASE_SALARY':
      return SalaryReferenceBaseEnum.percentageOfBaseSalary;
    case 'PERCENTAGE_OF_MINIMUM_WAGE':
      return SalaryReferenceBaseEnum.percentageOfMinimumWage;
    case 'PERCENTAGE_OF_COMPOSITION':
      return SalaryReferenceBaseEnum.percentageOfComposition;
  }
}

salaryReferenceBaseString(type) {
  switch (type) {
    case SalaryReferenceBaseEnum.freeValue:
      return 'FREE_VALUE';
    case SalaryReferenceBaseEnum.percentageOfBaseSalary:
      return 'PERCENTAGE_OF_BASE_SALARY';
    case SalaryReferenceBaseEnum.percentageOfMinimumWage:
      return 'PERCENTAGE_OF_MINIMUM_WAGE';
    case SalaryReferenceBaseEnum.percentageOfComposition:
      return 'PERCENTAGE_OF_COMPOSITION';
    default:
      return '';
  }
}
