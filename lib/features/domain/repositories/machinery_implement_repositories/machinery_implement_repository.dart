import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../core/usecase/usecase.dart';

abstract class MachineryImplementRepository {
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>>
      getAllMachineryImplementsToSelect(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<List<MachineryImplementEntity>>>>
      getAllMachineryImplements(NoParams noParams);

  Future<Either<ApplicationError, ResponseEntity<MachineryImplementEntity>>>
      getMachineryImplementById(ArgParams argParams);
}
