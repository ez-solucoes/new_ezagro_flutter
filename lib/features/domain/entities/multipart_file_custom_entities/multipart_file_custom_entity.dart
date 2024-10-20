import 'package:equatable/equatable.dart';

class MultipartFileCustomEntity extends Equatable {
  final String? name;
  final String? originalFilename;
  final String? contentType;
  final int? size;
  final String? content;

  const MultipartFileCustomEntity({
    this.name,
    this.originalFilename,
    this.contentType,
    this.size,
    this.content,
  });

  @override
  List<Object?> get props => [
        name,
        originalFilename,
        contentType,
        size,
        content,
      ];
}
