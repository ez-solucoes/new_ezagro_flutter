import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/farm_entities/farm_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';
import '../../../../../core/errors/application_error.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../entities/response_entities/response_entity.dart';
import 'get_all_farms_usecase.dart';

class GetAllFarmsUsecaseImpl implements GetAllFarmsUsecase {
  final FarmRepository repository;

  GetAllFarmsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<FarmEntity>>>> call(
      NoParams noParams) async {
    return await repository.getAllFarms(noParams);
  }
}