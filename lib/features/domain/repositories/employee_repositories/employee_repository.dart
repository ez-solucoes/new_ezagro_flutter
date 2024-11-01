import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../../../core/usecase/usecase.dart';

abstract class EmployeeRepository {
  Future<Either<ApplicationError, PaginationEntity<EmployeeEntity>>>
      getEmployees(NoParams noParams);
}
