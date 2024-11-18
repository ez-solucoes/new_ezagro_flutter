import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class CostCenterUsecase
    implements Usecase<PaginationEntity<CostCenterEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<CostCenterEntity>>> call(
      NoParams params);
}
