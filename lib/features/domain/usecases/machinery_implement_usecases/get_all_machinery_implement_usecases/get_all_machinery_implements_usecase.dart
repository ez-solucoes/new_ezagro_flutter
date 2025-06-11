import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/machinery_implement_entities/machinery_implement_entity.dart';
import '../../../entities/response_entities/response_entity.dart';

abstract class GetAllMachineryImplementsUsecase
    implements Usecase<ResponseEntity<List<MachineryImplementEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<MachineryImplementEntity>>>>
  call(NoParams params);
}
