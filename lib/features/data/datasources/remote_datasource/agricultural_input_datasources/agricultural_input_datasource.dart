import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class AgriculturalInputDatasource {
  Future<List<AgriculturalInputModel>> getAllAgriculturalInputs(NoParams noParams);
  Future<List<SelectModel>> getAllAgriculturalInputsToSelect(NoParams noParams);
  Future<ResponseModel<AgriculturalInputModel>> getAgriculturalInputById(ArgParams argParams);
}