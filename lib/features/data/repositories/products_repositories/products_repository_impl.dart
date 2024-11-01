import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/products_models/product_model.dart';

import '../../../domain/repositories/product_repositories/product_repository.dart';
import '../../datasources/Product_datasources/Product_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<ProductModel>>> getProducts(
      NoParams noParams) async {
    try {
      final result = await datasource.getProducts(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$ProductRepositoryImpl.getProducts',
          additionalInfo: stacktrace.toString()));
    }
  }
}
