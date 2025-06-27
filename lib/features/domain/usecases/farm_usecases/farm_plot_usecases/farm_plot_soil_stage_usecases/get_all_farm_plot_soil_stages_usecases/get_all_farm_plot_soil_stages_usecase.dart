import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';

import '../../../../../../../core/errors/application_error.dart';
import '../../../../../entities/response_entities/response_entity.dart';
import '../../../../../entities/type_entities/type_entity.dart';

abstract class GetAllFarmPlotSoilStagesUsecase implements Usecase<ResponseEntity<List<TypeEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<TypeEntity>>>> call(NoParams noParams);
}