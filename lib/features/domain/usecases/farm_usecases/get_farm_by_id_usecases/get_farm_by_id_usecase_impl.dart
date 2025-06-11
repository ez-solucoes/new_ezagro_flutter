import 'package:dartz/dartz.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../entities/farm_entities/farm_entity.dart';
import '../../../entities/response_entities/response_entity.dart';
import '../../../params/arg_params/arg_params.dart';
import '../../../repositories/farm_repositories/farm_repository.dart';
import 'get_farm_by_id_usecase.dart';

class GetFarmByIdUsecaseImpl implements GetFarmByIdUsecase {

  final FarmRepository repository;

  GetFarmByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<FarmEntity>>> call(
      ArgParams argParams) async {
    return await repository.getFarmById(argParams);
  }
}