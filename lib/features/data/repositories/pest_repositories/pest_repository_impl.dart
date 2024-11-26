import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/pest_models/pest_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/pest_repositories/pest_repository.dart';

import '../../datasources/remote_datasource/pest_datasources/pest_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class PestRepositoryImpl implements PestRepository {
  final PestDatasource datasource;

  PestRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<PestModel>>>
  getPests(NoParams noParams) async {
    try {
      final result = await datasource.getPests(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$PestRepositoryImpl.getPests',
          additionalInfo: stacktrace.toString()));
    }
  }
}
