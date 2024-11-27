import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/selector_entities/selector_entity.dart';

abstract class CostCenterSelectorUsecase
    implements Usecase<List<SelectorEntity>, NoParams> {
  @override
  Future<Either<ApplicationError, List<SelectorEntity>>> call(
      NoParams params);
}
