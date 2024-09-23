import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/activity_datasources/activity_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/activity_repository/activity_repository.dart';
import '../../models/paginatino_model/pagination_model.dart';

class ActivitytRepositoryImpl implements ActivityRepository {

  final ActivityDatasource datasource;

  ActivitytRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MockModel>>> getActvities(NoParams noParams) async {
    try{
      final result = await datasource.getActivities(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$ActivitytRepositoryImpl.getActivities',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}