import 'package:dartz/dartz.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/machinery_implement_entities/machinery_implement_entity.dart';
import '../../../repositories/machinery_repositories/machinery_repository.dart';
import 'get_all_machinery_usecase.dart';

class GetAllMachineryUsecaseImpl implements GetAllMachineryUsecase {
  final MachineryRepository repository;

  GetAllMachineryUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<MachineryImplementEntity>>>
  call(NoParams noParams) async {
    return await repository.getAllMachineryImplements(noParams);
  }
}