import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetEmployeeByIdUsecase implements Usecase<EmployeeEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, EmployeeEntity>> call(
      ArgParams argParams);
}