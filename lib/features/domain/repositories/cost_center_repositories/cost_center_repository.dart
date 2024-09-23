import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import '../../../../core/usecase/usecase.dart';

abstract class CostCenterRepository {
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> getCostCenters(NoParams noParams);
}