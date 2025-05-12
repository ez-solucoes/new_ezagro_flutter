import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_type_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class ProductTypeDatasource {
  Future<List<ProductTypeModel>> getAllProductTypes(NoParams noParams);
  Future<List<SelectModel>> getAllProductTypesToSelect(NoParams noParams);
  Future<List<SelectModel>> getFilteredProductTypesToSelect(ArgParams argParams);
  Future<ResponseModel<ProductTypeModel>> getProductTypeById(ArgParams argParams);
}