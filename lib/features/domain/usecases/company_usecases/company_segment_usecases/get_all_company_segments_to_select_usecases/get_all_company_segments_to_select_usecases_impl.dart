import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/company_repositories/company_segment_repository/company_segment_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/company_segment_usecases/get_all_company_segments_to_select_usecases/get_all_company_segments_to_select_usecases.dart';

import '../../../../../../core/errors/application_error.dart';
import '../../../../entities/response_entities/response_entity.dart';
import '../../../../entities/select_entities/select_entity.dart';

class GetAllCompanySegmentsToSelectUsecaseImpl implements GetAllCompanySegmentsToSelectUsecase {
  final CompanySegmentRepository repository;

  GetAllCompanySegmentsToSelectUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> call(ArgParams argParams) async {
    return await repository.getAllCompanySegmentsToSelect(argParams);
  }

}