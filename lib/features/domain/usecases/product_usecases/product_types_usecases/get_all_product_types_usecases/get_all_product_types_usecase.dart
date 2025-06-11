import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/products_entities/product_type_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllProductTypesUsecase implements Usecase<ResponseEntity<List<ProductTypeEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<ProductTypeEntity>>>> call(NoParams params);
}