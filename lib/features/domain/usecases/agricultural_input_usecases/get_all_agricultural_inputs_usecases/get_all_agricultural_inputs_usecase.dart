import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_input_entities/agricultural_input_entity.dart';

import '../../../../../core/errors/application_error.dart';

abstract class GetAllAgriculturalInputsUsecase implements Usecase<List<AgriculturalInputEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<AgriculturalInputEntity>>> call(NoParams noParams);
}