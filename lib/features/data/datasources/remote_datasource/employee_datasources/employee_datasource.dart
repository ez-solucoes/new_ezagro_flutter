import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';


abstract class EmployeeDatasource {
  Future<List<EmployeeModel>> getEmployees(NoParams noParams);
}
