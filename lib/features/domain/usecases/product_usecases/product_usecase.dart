import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class ProductUsecase implements Usecase<PaginationEntity<MockEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams params);
}