import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/farm_datasource/farm_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/farm_models/farm_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/farm_repositories/farm_repository.dart';
import '../../models/pagination_model/pagination_model.dart';

class FarmRepositoryImpl implements FarmRepository {

  final FarmDatasource datasource;

  FarmRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<FarmModel>>> getSimplifiedFarms(NoParams noParams) async {
    try{
      final result = await datasource.getSimplifiedFarms(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$FarmRepositoryImpl.getSimplifiedFarms',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}