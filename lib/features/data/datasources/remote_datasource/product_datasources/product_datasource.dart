import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class ProductDatasource {
  Future<ResponseModel<List<ProductModel>>> getAllProducts(NoParams noParams);
  Future<ResponseModel<List<SelectModel>>> getAllProductsToSelect(NoParams noParams);
  Future<ResponseModel<ProductModel>> getProductById(ArgParams argParams);
  Future<ResponseModel<List<ProductModel>>> getAllProductsByTypeId(ArgParams argParams);
  Future<ResponseModel<List<SelectModel>>> getAllProductsByTypeIdToSelect(ArgParams argParams);
}
