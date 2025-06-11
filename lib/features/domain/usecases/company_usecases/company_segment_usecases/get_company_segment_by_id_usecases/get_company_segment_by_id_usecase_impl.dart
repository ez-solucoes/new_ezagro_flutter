import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/company_repositories/company_segment_repository/company_segment_repository.dart';
import 'package:new_ezagro_flutter/features/domain/usecases/company_usecases/company_segment_usecases/get_company_segment_by_id_usecases/get_company_segment_by_id_usecase.dart';

import '../../../../entities/response_entities/response_entity.dart';

class GetCompanySegmentByIdUsecaseImpl implements GetCompanySegmentByIdUsecase {

  final CompanySegmentRepository repository;

  GetCompanySegmentByIdUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, ResponseEntity<SegmentEntity>>> call(ArgParams argParams) async {
    return await repository.getCompanySegmentById(argParams);
  }


}