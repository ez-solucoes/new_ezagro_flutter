import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetEmployeeListUsecase implements Usecase<List<EmployeeEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<EmployeeEntity>>> call(
      NoParams params);
}