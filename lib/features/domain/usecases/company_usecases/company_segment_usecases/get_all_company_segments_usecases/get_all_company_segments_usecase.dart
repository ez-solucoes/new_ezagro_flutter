import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';

import '../../../../entities/response_entities/response_entity.dart';

abstract class GetAllCompanySegmentsUsecase implements Usecase<ResponseEntity<List<SegmentEntity>>, NoParams> {
  @override
  Future<Either<ApplicationError, ResponseEntity<List<SegmentEntity>>>> call(NoParams params);
}