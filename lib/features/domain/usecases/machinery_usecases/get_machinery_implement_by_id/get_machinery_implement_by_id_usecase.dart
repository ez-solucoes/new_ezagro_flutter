import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

abstract class GetMachineryImplementByIdUsecase
    implements Usecase<ResponseModel<MachineryImplementEntity>, int> {
  @override
  Future<Either<ApplicationError, ResponseModel<MachineryImplementEntity>>> call(int id);
}
