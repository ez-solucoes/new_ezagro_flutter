import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import '../../../../domain/params/arg_params/arg_params.dart';

abstract class FarmDatasource {
  Future<ResponseModel<FarmModel>> getFarmById(ArgParams argParams);
  Future<ResponseModel<List<FarmModel>>> getAllFarmsByCostCenterId(ArgParams argParams);
  Future<ResponseModel<List<FarmModel>>> getAllFarms(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllFarmsToSelect(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllFarmsByCostCenterIdToSelect(ArgParams argParams);
}
