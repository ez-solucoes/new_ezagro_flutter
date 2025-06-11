import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_implement_repositories/machinery_implement_repository.dart';

import 'get_machinery_implement_by_id_usecase.dart';

class GetMachineryImplementByIdUsecaseImpl implements GetMachineryImplementByIdUsecase {
  final MachineryImplementRepository repository;

  GetMachineryImplementByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<MachineryImplementEntity>>> call(ArgParams argParams) async {
    return await repository.getMachineryImplementById(argParams);
  }
}
