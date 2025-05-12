import 'package:dartz/dartz.dart';
import '../../../../core/errors/application_error.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/employee_entities/employee_entity/employee_entity.dart';

abstract class EmployeeUsecase
    implements Usecase<List<EmployeeEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<EmployeeEntity>>> call(
      NoParams params);
}
