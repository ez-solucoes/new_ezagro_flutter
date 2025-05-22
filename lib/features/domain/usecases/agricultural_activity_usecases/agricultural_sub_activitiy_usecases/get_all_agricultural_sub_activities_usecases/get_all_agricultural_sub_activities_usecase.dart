import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/agricultural_entities/agricultural_sub_activity_entities/agricultural_sub_activity_entity.dart';

abstract class GetAllAgriculturalSubActivitiesUsecase
    implements Usecase<List<AgriculturalSubActivityEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<AgriculturalSubActivityEntity>>>
  call(NoParams params);
}