import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/cost_center_usecases/cost_center_usecase.dart';
import '../../../../core/errors/application_error.dart';

class CostCenterUsecaseImpl implements CostCenterUsecase {

  final CostCenterRepository repository;

  CostCenterUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams noParams) async {
    return await repository.getCostCenters(noParams);
  }
}