import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/employee_entities/employee_entity/employee_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../../../core/errors/application_error.dart';
import '../../repositories/executors_repositories/executors_repository.dart';
import 'executor_usecase.dart';

class ExecutorUsecaseImpl implements ExecutorUsecase {
  final ExecutorsRepository repository;

  ExecutorUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<EmployeeEntity>>> call(
      NoParams noParams) async {
    return await repository.getExecutors(noParams);
  }
}
