

import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';

import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllAgriculturalActivitiesUsecase
    implements Usecase<ResponseEntity<List<AgriculturalActivityEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalActivityEntity>>>>
      call(NoParams params);
}
