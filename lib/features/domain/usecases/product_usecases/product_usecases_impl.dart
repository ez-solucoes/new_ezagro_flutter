import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/product_usecases/product_usecase.dart';
import '../../../../core/errors/application_error.dart';
import '../../repositories/product_repositories/product_repository.dart';

class ProductUsecaseImpl implements ProductUsecase {

  final ProductRepository repository;

  ProductUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams noParams) async {
    return await repository.getProducts(noParams);
  }
}