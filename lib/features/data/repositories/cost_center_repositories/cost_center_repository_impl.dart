import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';

import '../../../domain/entities/selector_entities/selector_entity.dart';
import '../../datasources/remote_datasource/cost_center_datasource/cost_center_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class CostCenterRepositoryImpl implements CostCenterRepository {
  final CostCenterDatasource datasource;

  CostCenterRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<CostCenterModel>>>
      getCostCenters(NoParams noParams) async {
    try {
      final result = await datasource.getCostCenters(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getCostCenters',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectorEntity>>> getCostCentersSelectorOptions(NoParams noParams) async {
    try {
      final result = await datasource.getCostCentersSelectorOptions(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getCostCentersSelectorOptions',
          additionalInfo: stacktrace.toString()));
    }
  }
}
