import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllPlotsUsecase
    implements Usecase<ResponseEntity<List<PlotEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> call(
      NoParams params);
}
