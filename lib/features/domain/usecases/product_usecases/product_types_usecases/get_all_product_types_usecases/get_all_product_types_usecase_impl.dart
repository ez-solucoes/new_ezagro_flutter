import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/product_repositories/product_type_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_types_usecases/get_all_product_types_usecases/get_all_product_types_usecase.dart';

import '../../../../../../core/usecase/usecase.dart';

class GetAllProductTypesUsecaseImpl implements GetAllProductTypesUsecase {
  final ProductTypeRepository repository;

  GetAllProductTypesUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, List<ProductTypeEntity>>> call(NoParams noParams) async {
    return await repository.getAllProductTypes(noParams);
  }
}
