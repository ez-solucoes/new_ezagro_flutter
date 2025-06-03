import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllAgriculturalInputsToSelectUsecase implements Usecase<List<SelectEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams);
}