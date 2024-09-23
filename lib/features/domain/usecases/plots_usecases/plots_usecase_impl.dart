import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/plots_usecases/plots_usecase.dart';
import '../../../../core/errors/application_error.dart';
import '../../repositories/plots_repositories/plots_repository.dart';

class PlotsUsecaseImpl implements PlotsUsecase {

  final PlotsRepository repository;

  PlotsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams noParams) async {
    return await repository.getPlots(noParams);
  }
}