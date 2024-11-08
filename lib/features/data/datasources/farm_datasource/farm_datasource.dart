import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';

import '../../models/pagination_model/pagination_model.dart';

abstract class FarmDatasource {
  Future<PaginationModel<FarmModel>> getSimplifiedFarms(NoParams noParams);

  Future<List<FarmModel>> getCostCenterFarmsById(String costCenterId);
}
