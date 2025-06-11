import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pest_entities/pest_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetPestByIdUsecase implements Usecase<ResponseEntity<PestEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<PestEntity>>> call(ArgParams argParams);
}