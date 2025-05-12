import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/company_segment_usecases/get_all_company_segments_usecases/get_all_company_segments_usecases.dart';

import '../../../../repositories/company_repositories/company_segment_repository/company_segment_repository.dart';

class GetAllCompanySegmentsUsecaseImpl implements GetAllCompanySegmentsUsecase {
  final CompanySegmentRepository repository;

  GetAllCompanySegmentsUsecaseImpl( this.repository);

  @override
  Future<Either<ApplicationError, List<SegmentEntity>>> call(
      NoParams noParams) async {
    return await repository.getAllCompanySegments(noParams);
  }

}