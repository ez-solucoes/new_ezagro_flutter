import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import '../../../entities/farm_entities/farm_entity.dart';

abstract class GetAllFarmsUsecase implements Usecase<ResponseEntity<List<FarmEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>> call(
      NoParams params);
}