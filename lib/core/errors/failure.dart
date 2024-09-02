import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});
}

class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class NullParamFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required super.message});

  @override
  List<Object?> get props => [];
}