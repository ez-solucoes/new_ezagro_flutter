import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/get_all_plots_by_farm_id_usecases/get_all_plots_by_farm_id_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../repositories/plots_repositories/plots_repository.dart';

class GetAllPlotsByFarmIdUsecaseImpl implements GetAllPlotsByFarmIdUsecase {

  final PlotsRepository repository;

  GetAllPlotsByFarmIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<PlotEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllPlotsByFarmId(argParams);
  }

}
