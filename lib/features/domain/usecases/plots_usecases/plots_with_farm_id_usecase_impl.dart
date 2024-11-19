import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_with_farm_id_usecase.dart';

import '../../../../core/errors/application_error.dart';
import '../../repositories/plots_repositories/plots_repository.dart';

class PlotsWithFarmIdUsecaseImpl implements PlotsWithFarmIdUsecase {

  final PlotsRepository repository;

  PlotsWithFarmIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<PlotEntity>>> call(
      ArgParams params) async {
    return await repository.getPlotsByFarmId(params);
  }
}
