import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/features/domain/entities/response_entities/response_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/select_entities/select_entity.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../params/arg_params/arg_params.dart';

abstract class CompanySegmentRepository {
  Future<Either<ApplicationError, ResponseEntity<List<SegmentEntity>>>> getAllCompanySegments(NoParams noParams);
  Future<Either<ApplicationError, ResponseEntity<SegmentEntity>>> getCompanySegmentById(ArgParams argParams);
  Future<Either<ApplicationError, ResponseEntity<List<SelectEntity>>>> getAllCompanySegmentsToSelect(ArgParams argParams);
}