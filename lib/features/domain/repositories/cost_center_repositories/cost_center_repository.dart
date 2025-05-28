import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/cost_center_entities/cost_center_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../params/arg_params/arg_params.dart';

abstract class CostCenterRepository {
  Future<Either<ApplicationError, List<CostCenterEntity>>> getAllCostCenters(NoParams noParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllCostCentersToSelect(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<CostCenterEntity>>> getCostCenterById(ArgParams argParams);
  Future<Either<ApplicationError, List<CostCenterEntity>>> getAllCostCentersByCostCenterTypeId(ArgParams argParams);
  Future<Either<ApplicationError, List<SelectEntity>>> getAllCostCentersByCostCenterTypeIdToSelect(ArgParams argParams);
}
