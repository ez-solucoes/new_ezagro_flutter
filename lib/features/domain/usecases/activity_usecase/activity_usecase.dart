import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/agricultural_entities/agricultural_activity_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class ActivityUsecase
    implements Usecase<PaginationEntity<AgriculturalActivityEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<AgriculturalActivityEntity>>>
      call(NoParams params);
}
