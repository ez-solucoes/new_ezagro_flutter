import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/machinery_datasources/machinery_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/machinery_repositories/machinery_repository.dart';
import '../../models/paginatino_model/pagination_model.dart';

class MachineryRepositoryImpl implements MachineryRepository {

  final MachineryDatasource datasource;

  MachineryRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MockModel>>> getMachinery(NoParams noParams) async {
    try{
      final result = await datasource.getMachinery(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$MachineryRepositoryImpl.getMachinery',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}