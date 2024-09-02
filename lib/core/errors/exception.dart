import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class UnauthorizedException extends Equatable implements Exception {
  final String? message;
  final int? statusCode;

  const UnauthorizedException(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}
