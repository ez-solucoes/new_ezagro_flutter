import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/segment_entities/segment_entity.dart';
import 'package:new_ezagro_flutter/features/domain/params/arg_params/arg_params.dart';

abstract class GetCompanySegmentByIdUsecase implements Usecase<SegmentEntity, ArgParams> {
  @override
  Future<Either<ApplicationError, SegmentEntity>> call(ArgParams params);
}