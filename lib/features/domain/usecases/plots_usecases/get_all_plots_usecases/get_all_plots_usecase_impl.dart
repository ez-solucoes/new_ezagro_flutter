import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/get_all_plots_usecases/get_all_plots_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../repositories/plots_repositories/plots_repository.dart';

class GetAllPlotsUsecaseImpl implements GetAllPlotsUsecase {
  final PlotsRepository repository;

  GetAllPlotsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllPlots(noParams);
  }
}
