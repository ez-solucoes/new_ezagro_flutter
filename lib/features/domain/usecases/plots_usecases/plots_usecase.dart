import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/plot_entities/plot_entity.dart';

abstract class PlotsUsecase implements Usecase<PaginationEntity<PlotEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<PlotEntity>>> call(NoParams params);
}