import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class MachineryUsecase
    implements Usecase<PaginationEntity<MachineryImplementEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<MachineryImplementEntity>>>
      call(NoParams params);
}
