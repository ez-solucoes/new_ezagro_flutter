import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import '../../../../domain/params/arg_params/arg_params.dart';
import '../../../models/pagination_model/pagination_model.dart';

abstract class FarmDatasource {
  Future<ResponseModel<PaginationModel<FarmModel>>> getSimplifiedFarms(NoParams noParams);

  Future<ResponseModel<FarmModel>> getFarmById(ArgParams argParams);

  Future<ResponseModel<List<FarmModel>>> getAllFarmsByCostCenterId(String costCenterId);

  Future<List<FarmModel>> getAllFarms(NoParams noParams);
  Future<List<SelectModel>> getAllFarmsToSelect(NoParams noParams);
  Future<List<SelectModel>> getAllFarmsByCostCenterIdToSelect(ArgParams argParams);
}
