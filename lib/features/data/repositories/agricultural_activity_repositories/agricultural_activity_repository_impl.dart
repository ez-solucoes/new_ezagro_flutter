import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/errors/generic_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/agricultural_models/agricultural_activity_model.dart';



import '../../../domain/repositories/agricultural_activity_repositories/agricultural_activity_repository.dart';
import '../../datasources/remote_datasource/agricultural_activity_datasources/agricultural_activity_datasource.dart';
import '../../models/pagination_model/pagination_model.dart';

class AgriculturalActivityRepositoryImpl implements AgriculturalActivityRepository {
  final AgriculturalActivityDatasource datasource;

  AgriculturalActivityRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, PaginationModel<AgriculturalActivityModel>>>
  getAllAgriculturalActivities(NoParams noParams) async {
    try {
      final result = await datasource.getAllAgriculturalActivities(noParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$AgriculturalActivityRepositoryImpl.getAllAgriculturalActivities',
          additionalInfo: stacktrace.toString()));
    }
  }
}
