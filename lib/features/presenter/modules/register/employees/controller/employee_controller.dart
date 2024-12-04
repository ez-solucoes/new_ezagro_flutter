import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../domain/entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../../../domain/usecases/employee_usecase/get_employee_list_usecase/get_employee_list_usecase.dart';

part 'employee_controller.g.dart';

class EmployeeController = EmployeeControllerAbstract with _$EmployeeController;

abstract class EmployeeControllerAbstract with Store {


  @observable
  bool isLoading = false;

  @observable
  List<EmployeeEntity> employees = ObservableList();

  @observable
  List<EmployeeEntity> filteredEmployees = ObservableList();

  @observable
  EmployeeEntity? employee;

  @action
  Future getEmployeesList() async {
    isLoading = true;
    final getEmployees = Modular.get<GetEmployeeListUsecase>();
    final result = await getEmployees(NoParams());
    result.fold((error) => error.friendlyMessage, (success) {
      employees = success;
      filteredEmployees = employees;
      return success;
    });

    isLoading = false;
  }

  @action
  searchEmployee(String searchText) {
    filteredEmployees = employees.where((e) =>
    (e.name?.toLowerCase() ?? "").contains(searchText.toLowerCase()) ||
        (e.position?.toLowerCase() ?? "").contains(searchText.toLowerCase())
    ).toList();
  }

}
