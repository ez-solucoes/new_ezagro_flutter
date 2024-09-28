import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/datasources/crop_datasource/crop_datasource.dart';
import 'package:new_ezagro_flutter/features/data/models/mock_model/mock_model.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/crop_repositories/crop_repository.dart';
import '../../models/paginatino_model/pagination_model.dart';

class CropRepositoryImpl implements CropRepository{

  final CropDatasource datasource;

  CropRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<MockModel>>> getSimplifiedCrops(NoParams noParams) async {
    try{
      final result = await datasource.getSimplifiedCrops(noParams);
      return Right(result);
    } on ApplicationError catch(e) {
      return Left(e);
    } catch(e, stacktrace) {
      return Left(
          GenericError(
              fingerprint: '$CropRepositoryImpl.getSimplifiedCrops',
              additionalInfo: stacktrace.toString()
          )
      );
    }
  }

}