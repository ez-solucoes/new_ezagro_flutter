import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CostCenterRepository {
  Future<Either<ApplicationError, PaginationEntity<CostCenterEntity>>>
      getCostCenters(NoParams noParams);

  Future<Either<ApplicationError, List<SelectorEntity>>> getCostCentersSelectorOptions(NoParams noParams);
}
