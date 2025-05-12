import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';
import '../../../../core/errors/application_error.dart';
import 'get_all_cost_center_to_select_usecase.dart';

class GetAllCostCenterToSelectUsecaseImpl implements GetAllCostCenterToSelectUsecase {
  final CostCenterRepository repository;

  GetAllCostCenterToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllCostCenterToSelect(noParams);
  }
}
