import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetMachineryImplementByIdUsecase
    implements Usecase<ResponseEntity<MachineryImplementEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<MachineryImplementEntity>>> call(ArgParams argParams);
}
