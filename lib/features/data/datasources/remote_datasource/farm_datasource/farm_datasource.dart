import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import '../../../models/pagination_model/pagination_model.dart';

abstract class FarmDatasource {
  Future<ResponseModel<PaginationModel<FarmModel>>> getSimplifiedFarms(NoParams noParams);

  Future<ResponseModel<List<FarmModel>>> getCostCenterFarmsById(String costCenterId);

  Future<List<FarmModel>> getAllFarms(NoParams noParams);
}
