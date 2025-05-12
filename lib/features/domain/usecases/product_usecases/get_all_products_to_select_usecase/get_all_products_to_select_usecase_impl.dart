import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/get_all_products_to_select_usecase/get_all_products_to_select_usecase.dart';

import '../../../repositories/product_repositories/product_repository.dart';

class GetAllProductsToSelectUsecaseImpl implements GetAllProductsToSelectUsecase {
  final ProductRepository repository;

  GetAllProductsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<SelectEntity>>> call(NoParams noParams) async {
    return await repository.getAllProductsToSelect(noParams);
  }

}