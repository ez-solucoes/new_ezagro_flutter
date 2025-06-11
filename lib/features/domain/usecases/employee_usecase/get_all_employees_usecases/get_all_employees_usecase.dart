import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllEmployeesUsecase implements Usecase<ResponseEntity<List<EmployeeEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<EmployeeEntity>>>> call(
      NoParams params);
}