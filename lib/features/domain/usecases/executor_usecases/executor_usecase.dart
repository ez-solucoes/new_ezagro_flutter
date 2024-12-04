import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class ExecutorUsecase
    implements Usecase<PaginationEntity<EmployeeEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<EmployeeEntity>>> call(
      NoParams params);
}
