import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

import '../../../../core/usecase/usecase.dart';

abstract class MachineryRepository {
  Future<Either<ApplicationError, PaginationEntity<MachineryImplementEntity>>> getMachinery(
      NoParams noParams);

  Future<Either<ApplicationError, List<MachineryImplementEntity>>> getAllMachineryImplements(
      NoParams noParams);

  Future<Either<ApplicationError, ResponseModel<MachineryImplementEntity>>>
      getMachineryImplementById(int id);
}
