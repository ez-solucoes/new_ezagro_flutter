import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/cost_center_datasource/cost_center_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/cost_center_repositories/cost_center_repository.dart';
import '../../models/paginatino_model/pagination_model.dart';

class CostCenterRepositoryImpl implements CostCenterRepository {

  final CostCenterDatasource datasource;

  CostCenterRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MockModel>>> getCostCenters(NoParams noParams) async {
    try{
      final result = await datasource.getCostCenters(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$CostCenterRepositoryImpl.getCostCenters',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}