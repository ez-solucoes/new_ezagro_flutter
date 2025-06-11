import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../entities/select_entities/select_entity.dart';

abstract class GetAllAgriculturalSubActivitiesToSelectUsecase
    implements Usecase<ResponseEntity<List<SelectEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(NoParams params);
}