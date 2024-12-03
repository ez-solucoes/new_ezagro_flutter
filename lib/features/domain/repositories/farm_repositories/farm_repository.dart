import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../data/models/farm_models/farm_model.dart';

abstract class FarmRepository {

  Future<Either<ApplicationError, List<FarmModel>>>
  getAllFarms(NoParams noParams);

  Future<Either<ApplicationError, PaginationEntity<FarmEntity>>>
      getSimplifiedFarms(NoParams noParams);

  Future<Either<ApplicationError, List<FarmEntity>>>
  getCostCenterFarms(String costCenterId);

}
