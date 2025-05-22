import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/entities/type_entities/type_entity.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../../../core/usecase/usecase.dart';

abstract class GetAllAgriculturalActivityTypesUsecase
    implements Usecase<List<TypeEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<TypeEntity>>> call(NoParams params);
}