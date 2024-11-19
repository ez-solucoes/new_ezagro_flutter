import 'package:equatable/equatable.dart';

class ResponseEntity<T> extends Equatable {
  final T? data;
  final String? message;
  final int? status;
  final String? path;

  const ResponseEntity({
    this.data,
    this.message,
    this.path,
    this.status,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        path,
        status,
      ];
}
