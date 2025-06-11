import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/farm_entities/farm_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetFarmByIdUsecase implements Usecase<ResponseEntity<FarmEntity>, ArgParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<FarmEntity>>> call(
      ArgParams argParams);
}