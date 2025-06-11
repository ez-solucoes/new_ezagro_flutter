
// [ EMPLOYEE, OUTSOURCE ]

enum EmployeeOrOutsourceEnum {
  employee,
  outsource,
  none,
}

EmployeeOrOutsourceEnum employeeOrOutsourceEnum(String type) {
  switch (type) {
    case 'EMPLOYEE':
      return EmployeeOrOutsourceEnum.employee;
    case 'OUTSOURCE':
      return EmployeeOrOutsourceEnum.outsource;
      default:
        return EmployeeOrOutsourceEnum.none;
  }
}

String dutyTypeString(EmployeeOrOutsourceEnum type) {
  switch (type) {
    case EmployeeOrOutsourceEnum.employee:
      return 'EMPLOYEE';
    case EmployeeOrOutsourceEnum.outsource:
      return 'OUTSOURCE';
    default:
      return '';
  }
}
