import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/crop_repositories/crop_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/crop_usecases/crop_usecase.dart';
import '../../../../core/errors/application_error.dart';

class CropUsecaseImpl implements CropUsecase {

  final CropRepository repository;

  CropUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams noParams) async {
    return await repository.getSimplifiedCrops(noParams);
  }
}