import 'package:new_ezagro_flutter/features/data/models/agricultural_input_models/agricultural_input_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

abstract class AgriculturalInputDatasource {
  Future<List<AgriculturalInputModel>> getAllAgriculturalInputs();
  Future<List<SelectModel>> getAllAgriculturalInputsToSelect();
  Future<ResponseModel<AgriculturalInputModel>> getAgriculturalInputById(int id);
}