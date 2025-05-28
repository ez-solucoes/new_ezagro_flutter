import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/crop_models/crop_variety_model.dart';

import '../../../../../domain/params/arg_params/arg_params.dart';
import '../../../../models/response_models/response_model.dart';
import '../../../../models/select_models/select_model.dart';

abstract class CropVarietyDatasource {
  Future<List<CropVarietyModel>> getAllCropVarieties(NoParams noParams);
  Future<List<SelectModel>> getAllCropVarietiesToSelect(NoParams noParams);
  Future<ResponseModel<CropVarietyModel>> getCropVarietyById(ArgParams argParams);
  Future<List<CropVarietyModel>> getAllCropVarietiesByCropId(ArgParams argParams);
  Future<List<SelectModel>> getAllCropVarietiesByCropIdToSelect(ArgParams argParams);
}
