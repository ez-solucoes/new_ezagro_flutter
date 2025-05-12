import 'package:equatable/equatable.dart';

class MachineryImplementTypeEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final bool isMachineryType;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const MachineryImplementTypeEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.isMachineryType,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        isMachineryType,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
