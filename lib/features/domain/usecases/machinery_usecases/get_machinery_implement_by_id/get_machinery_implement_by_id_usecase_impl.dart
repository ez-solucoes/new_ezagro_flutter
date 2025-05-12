import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/domain/entities/machinery_implement_entities/machinery_implement_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_repositories/machinery_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/machinery_usecases/get_machinery_implement_by_id/get_machinery_implement_by_id_usecase.dart';

class GetMachineryImplementByIdUsecaseImpl implements GetMachineryImplementByIdUsecase {
  final MachineryRepository repository;

  GetMachineryImplementByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseModel<MachineryImplementEntity>>> call(int id) async {
    return await repository.getMachineryImplementById(id);
  }
}
