import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import '../../../entities/farm_entities/farm_entity.dart';

abstract class GetFarmListUsecase implements Usecase<List<FarmEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<FarmEntity>>> call(
      NoParams params);
}