import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_by_type_id_usecases/get_all_products_by_type_id_usecase.dart';

class GetAllProductsByTypeIdUsecaseImpl implements GetAllProductsByTypeIdUsecase {
  final ProductRepository repository;

  GetAllProductsByTypeIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ProductEntity>>> call(ArgParams argParams) async {
    return await repository.getAllProductsByTypeId(argParams);
  }
}
