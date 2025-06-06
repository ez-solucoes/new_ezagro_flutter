import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart'; // Importe ResponseModel
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart'; // Importe ArgParams

abstract class AgriculturalInputDatasource {
  Future<ResponseModel<AgriculturalInputModel>> getAgriculturalInputById(ArgParams argParams);
  Future<ResponseModel<List<AgriculturalInputModel>>> getAllAgriculturalInputs(ArgParams argParams);
  Future<ResponseModel<List<SelectModel>>> getAllAgriculturalInputsToSelect(ArgParams argParams);
  Future<ResponseModel<List<SelectModel>>> getAllAgriculturalInputsByClassIdToSelect(ArgParams argParams);
  Future<ResponseModel<List<AgriculturalInputModel>>> getAllAgriculturalInputsByClassId(ArgParams argParams);
}