import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';
import '../../../../core/errors/application_error.dart';
import 'cost_center_selector_usecase.dart';

class CostCenterSelectorUsecaseImpl implements CostCenterSelectorUsecase {
  final CostCenterRepository repository;

  CostCenterSelectorUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectorEntity>>> call(
      NoParams noParams) async {
    return await repository.getCostCentersSelectorOptions(noParams);
  }
}
