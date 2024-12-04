// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeController on EmployeeControllerAbstract, Store {
  late final _$isLoadingAtom =
      Atom(name: 'EmployeeControllerAbstract.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$employeesAtom =
      Atom(name: 'EmployeeControllerAbstract.employees', context: context);

  @override
  List<EmployeeEntity> get employees {
    _$employeesAtom.reportRead();
    return super.employees;
  }

  @override
  set employees(List<EmployeeEntity> value) {
    _$employeesAtom.reportWrite(value, super.employees, () {
      super.employees = value;
    });
  }

  late final _$filteredEmployeesAtom = Atom(
      name: 'EmployeeControllerAbstract.filteredEmployees', context: context);

  @override
  List<EmployeeEntity> get filteredEmployees {
    _$filteredEmployeesAtom.reportRead();
    return super.filteredEmployees;
  }

  @override
  set filteredEmployees(List<EmployeeEntity> value) {
    _$filteredEmployeesAtom.reportWrite(value, super.filteredEmployees, () {
      super.filteredEmployees = value;
    });
  }

  late final _$employeeAtom =
      Atom(name: 'EmployeeControllerAbstract.employee', context: context);

  @override
  EmployeeEntity? get employee {
    _$employeeAtom.reportRead();
    return super.employee;
  }

  @override
  set employee(EmployeeEntity? value) {
    _$employeeAtom.reportWrite(value, super.employee, () {
      super.employee = value;
    });
  }

  late final _$getEmployeesListAsyncAction = AsyncAction(
      'EmployeeControllerAbstract.getEmployeesList',
      context: context);

  @override
  Future<dynamic> getEmployeesList() {
    return _$getEmployeesListAsyncAction.run(() => super.getEmployeesList());
  }

  late final _$EmployeeControllerAbstractActionController =
      ActionController(name: 'EmployeeControllerAbstract', context: context);

  @override
  dynamic searchEmployee(String searchText) {
    final _$actionInfo = _$EmployeeControllerAbstractActionController
        .startAction(name: 'EmployeeControllerAbstract.searchEmployee');
    try {
      return super.searchEmployee(searchText);
    } finally {
      _$EmployeeControllerAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
employees: ${employees},
filteredEmployees: ${filteredEmployees},
employee: ${employee}
    ''';
  }
}
