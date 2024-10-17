import 'package:equatable/equatable.dart';

class AccountTypeEntity extends Equatable {
  final int id;
  final String? name;
  final String? description;
  final bool? active;

  const AccountTypeEntity({
    required this.id,
    this.name,
    this.description,
    this.active,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    active,
  ];
}
