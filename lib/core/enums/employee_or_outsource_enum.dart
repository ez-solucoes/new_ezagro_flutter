// [ EMPLOYEE, OUTSOURCE ]

enum EmployeeOrOutsourceEnum {
  employee,
  outsource,
}

employeeOrOutsourceEnum(String type) {
  switch (type) {
    case 'EMPLOYEE':
      return EmployeeOrOutsourceEnum.employee;
    case 'OUTSOURCE':
      return EmployeeOrOutsourceEnum.outsource;
  }
}

dutyTypeString(type) {
  switch (type) {
    case EmployeeOrOutsourceEnum.employee:
      return 'EMPLOYEE';
    case EmployeeOrOutsourceEnum.outsource:
      return 'OUTSOURCE';
    default:
      return '';
  }
}
