import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/class_entities/class_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllAgriculturalInputClassesUsecase implements Usecase<ResponseEntity<List<ClassEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<ClassEntity>>>> call(NoParams noParams);
}