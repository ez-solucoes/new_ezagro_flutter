import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

import '../../../../../../core/errors/application_error.dart';

abstract class GetAllAgriculturalInputClassesUsecase implements Usecase<List<ClassEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<ClassEntity>>> call(NoParams noParams);
}