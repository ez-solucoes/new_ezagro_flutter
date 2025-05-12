import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_usecase/get_all_products_usecase.dart';

import '../../../../../core/errors/application_error.dart';
import '../../../repositories/product_repositories/product_repository.dart';

class GetAllProductsUsecaseImpl implements GetAllProductsUsecase {
  final ProductRepository repository;

  GetAllProductsUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ProductEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllProducts(noParams);
  }
}
