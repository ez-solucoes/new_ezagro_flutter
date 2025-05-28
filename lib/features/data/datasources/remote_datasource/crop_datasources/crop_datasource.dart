import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/crop_models/crop_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class CropDatasource {
  Future<List<CropModel>> getAllCrops(NoParams noParams);

  Future<List<SelectModel>> getAllCropsToSelect(NoParams noParams);

  Future<ResponseModel<CropModel>> getCropById(ArgParams argParams);
}
