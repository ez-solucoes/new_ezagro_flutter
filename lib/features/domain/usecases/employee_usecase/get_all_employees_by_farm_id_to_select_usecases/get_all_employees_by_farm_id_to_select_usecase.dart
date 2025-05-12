import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/usecase/usecase.dart';

abstract class GetAllEmployeesByFarmIdToSelectUsecase implements Usecase<List<SelectEntity>, ArgParams> {

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(ArgParams argParams);
}