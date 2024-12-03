import 'package:equatable/equatable.dart';

class PermissionsEntity extends Equatable {
  final int id;
  final String? name;
  final String? slug;

  const PermissionsEntity({
    required this.id,
    this.name,
    this.slug,
  });

  @override
  List<Object?> get props => [id, name, slug];
}