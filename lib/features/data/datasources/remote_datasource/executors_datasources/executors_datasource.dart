import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/employee_models/employee_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class ExecutorsDatasource {
  Future<ResponseModel<PaginationModel<EmployeeModel>>> getExecutors(NoParams noParams);
}
