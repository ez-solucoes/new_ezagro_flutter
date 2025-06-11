import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class ExecutorsDatasource {
  Future<ResponseModel<List<EmployeeModel>>> getAllExecutors(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllExecutorsToSelect(NoParams noParams);
  Future<ResponseModel<EmployeeModel>> getExecutorById(ArgParams argParams);
}
