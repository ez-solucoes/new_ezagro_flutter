import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/machinery_implement_entities/machinery_implement_entity.dart';

abstract class GetAllMachineryUsecase
    implements Usecase<List<MachineryImplementEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<MachineryImplementEntity>>>
  call(NoParams params);
}
