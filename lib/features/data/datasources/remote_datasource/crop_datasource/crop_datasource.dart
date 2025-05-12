import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/crop_models/crop_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';

import '../../../models/pagination_model/pagination_model.dart';

abstract class CropDatasource {
  Future<ResponseModel<PaginationModel<CropModel>>> getSimplifiedCrops(NoParams noParams);
}
