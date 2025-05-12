import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_product_by_id_usecases/get_product_by_id_usecase.dart';

class GetProductByIdUsecaseImpl implements GetProductByIdUsecase {
  final ProductRepository repository;

  GetProductByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<ProductEntity>>> call(ArgParams params) async {
    return repository.getProductById(params);
  }
}