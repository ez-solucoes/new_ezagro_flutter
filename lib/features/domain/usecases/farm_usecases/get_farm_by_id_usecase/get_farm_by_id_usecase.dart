import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/farm_entities/farm_entity.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class GetFarmByIdUsecase implements Usecase<FarmEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, FarmEntity>> call(
      ArgParams argParams);
}