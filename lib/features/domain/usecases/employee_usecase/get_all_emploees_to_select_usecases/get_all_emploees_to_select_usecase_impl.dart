import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';

import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import 'package:new_ezagro_flutter/features/domain/repositories/employee_repositories/employee_repository.dart';

import '../../../../../core/usecase/usecase.dart';
import 'get_all_emploees_to_select_usecase.dart';

class GetAllEmployeesToSelectUsecaseImpl implements GetAllEmployeesToSelectUsecase {
  final EmployeeRepository repository;

  const GetAllEmployeesToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllEmployeesToSelect(noParams);
  }
}
