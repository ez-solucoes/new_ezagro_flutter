import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetAllEmployeesByFarmIdUsecase implements Usecase<ResponseEntity<List<EmployeeEntity>>, ArgParams> {

  @override
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>> call(ArgParams argParams);
}