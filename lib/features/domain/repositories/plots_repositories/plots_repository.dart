import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';
import '../../../../core/usecase/usecase.dart';

abstract class PlotsRepository {
  Future<Either<ApplicationError, PaginationEntity<PlotEntity>>> getPlots(NoParams noParams);
}