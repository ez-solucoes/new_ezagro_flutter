import 'package:dartz/dartz.dart';

import 'package:new_ezagro_flutter/core/errors/application_error.dart';

import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/data/models/response_models/response_model.dart';
import 'package:new_ezagro_flutter/features/data/models/segment_models/segment_model.dart';
import 'package:new_ezagro_flutter/features/data/models/select_models/select_model.dart';

import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

import '../../../../../core/errors/generic_error.dart';
import '../../../../domain/repositories/company_repositories/company_segment_repository/company_segment_repository.dart';
import '../../../datasources/remote_datasource/company_datasources/company_segment_datasources/company_segment_datasource.dart';

class CompanySegmentRepositoryImpl implements CompanySegmentRepository {
  final CompanySegmentDatasource datasource;

  CompanySegmentRepositoryImpl(this.datasource);

  @override
  Future<Either<ApplicationError, List<SegmentModel>>> getAllCompanySegments(NoParams noParams) async {
    try {
      final result = await datasource.getAllCompanySegments(noParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanySegmentRepositoryImpl.getAllCompanySegments',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, List<SelectModel>>> getAllCompanySegmentsToSelect(ArgParams argParams) async {
    try {
      final result = await datasource.getAllCompanySegmentsToSelect(argParams);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanySegmentRepositoryImpl.getAllCompanySegmentsToSelect',
          additionalInfo: stacktrace.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, SegmentModel>> getCompanySegmentById(ArgParams argParams) async {
    try {
      final result = await datasource.getCompanySegmentById(argParams);
      return Right(result.data!);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stacktrace) {
      return Left(GenericError(
          fingerprint: '$CompanySegmentRepositoryImpl.getCompanySegmentById',
          additionalInfo: stacktrace.toString()));
    }
  }
}