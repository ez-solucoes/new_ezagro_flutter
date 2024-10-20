import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machine_implement_entities/machine_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';

abstract class MachineryUsecase
    implements Usecase<PaginationEntity<MachineImplementEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, PaginationEntity<MachineImplementEntity>>>
      call(NoParams params);
}
