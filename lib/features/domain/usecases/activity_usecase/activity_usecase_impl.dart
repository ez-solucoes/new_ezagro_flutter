import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/usecase/usecase.dart';
import 'package:new_ezagro_flutter/features/domain/entities/mockEntity/mock_entity.dart';
import 'package:new_ezagro_flutter/features/domain/entities/pagination_entity/pagination_entity.dart';
import 'package:new_ezagro_flutter/features/domain/repositories/activity_repository/activity_repository.dart';
import '../../../../core/errors/application_error.dart';
import 'activity_usecase.dart';

class ActivityUsecaseImpl implements ActivityUsecase {

  final ActivityRepository repository;

  ActivityUsecaseImpl(this.repository);

  @override
  Future<Either<ApplicationError, PaginationEntity<MockEntity>>> call(NoParams noParams) async {
    return await repository.getActvities(noParams);
  }
}