import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';

import '../../../domain/entities/select_entities/select_entity.dart';
import '../../datasources/remote_datasource/cost_center_datasource/cost_center_datasource.dart';

class CostCenterRepositoryImpl implements CostCenterRepository {
  final CostCenterDatasource datasource;

  CostCenterRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<CostCenterModel>>> getAllCostCenters(NoParams noParams) async {
    try {
      final result = await datasource.getAllCostCenters(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CostCenterRepositoryImpl.getAllCostCenters',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<CostCenterModel>>> getAllCostCentersByCostCenterTypeId(ArgParams argParams) async {
    // TODO: implement getAllCostCentersByCostCenterTypeId
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllCostCentersByCostCenterTypeIdToSelect(ArgParams argParams) {
    // TODO: implement getAllCostCentersByCostCenterTypeIdToSelect
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllCostCentersToSelect(NoParams noParams) {
    // TODO: implement getAllCostCentersToSelect
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, ResponseModel<CostCenterModel>>> getCostCenterById(ArgParams argParams) {
    // TODO: implement getCostCenterById
    throw UnimplementedError();
  }


}
