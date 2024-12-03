import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/farm_usecases/get_farm_list_usecase/get_farm_list_usecase.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';

class GetFarmListUsecaseImpl implements GetFarmListUsecase {
  final FarmRepository repository;

  GetFarmListUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<FarmEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllFarms(noParams);
  }
}