import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/cost_center_models/cost_center_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class CostCenterDatasource {
  Future<ResponseModel<List<CostCenterModel>>> getAllCostCenters(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllCostCentersToSelect(NoParams noParams);
  Future<ResponseModel<CostCenterModel>> getCostCenterById(ArgParams argParams);
  Future<ResponseModel<List<CostCenterModel>>> getAllCostCentersByCostCenterTypeId(ArgParams argParams);
  Future<ResponseModel<List<SelectModel>>> getAllCostCentersByCostCenterTypeIdToSelect(ArgParams argParams);
}
