import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/response_models/response_model.dart';


abstract class EmployeeDatasource {
  Future<ResponseModel<List<EmployeeModel>>> getAllEmployees(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllEmployeesToSelect(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllEmployeesByFarmIdToSelect(ArgParams argParams);
  Future<ResponseModel<List<EmployeeModel>>> getAllEmployeesByFarmId(ArgParams argParams);
  Future<ResponseModel<EmployeeModel>> getEmployeeById(ArgParams argParams);
}
