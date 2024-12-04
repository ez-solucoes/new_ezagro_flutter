import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/response_models/response_model.dart';


abstract class EmployeeDatasource {
  Future<List<EmployeeModel>> getEmployees(NoParams noParams);

  Future<ResponseModel<EmployeeModel>> getEmployeeById(ArgParams argParams);
}
