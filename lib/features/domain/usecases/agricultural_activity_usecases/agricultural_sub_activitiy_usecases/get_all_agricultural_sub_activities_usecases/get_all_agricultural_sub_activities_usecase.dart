import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';
import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllAgriculturalSubActivitiesUsecase
    implements Usecase<ResponseEntity<List<AgriculturalSubActivityEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<AgriculturalSubActivityEntity>>>>
  call(NoParams params);
}