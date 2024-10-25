import 'package:equatable/equatable.dart';

class PermissionsEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;

  const PermissionsEntity({
    required this.id,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [id, name, description];
}