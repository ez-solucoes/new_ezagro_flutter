import 'package:equatable/equatable.dart';

class MultipartFileCustomEntity extends Equatable {
  final String name;
  final String originalFilename;
  final String contentType;
  final int size;
  final List<String> content;

  const MultipartFileCustomEntity({
    required this.name,
    required this.originalFilename,
    required this.contentType,
    required this.size,
    required this.content,
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
