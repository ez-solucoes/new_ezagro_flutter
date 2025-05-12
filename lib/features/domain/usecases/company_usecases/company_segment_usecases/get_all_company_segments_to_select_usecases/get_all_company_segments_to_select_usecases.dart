import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../../core/errors/application_error.dart';

abstract class GetAllCompanySegmentsToSelectUsecase implements Usecase<List<SelectEntity>, ArgParams> {

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(ArgParams argParams);
}