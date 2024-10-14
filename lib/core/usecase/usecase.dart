import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:new_ezagro_flutter/core/errors/application_error.dart';

abstract class Usecase<Output, Input> {
  Future<Either<ApplicationError, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];

}