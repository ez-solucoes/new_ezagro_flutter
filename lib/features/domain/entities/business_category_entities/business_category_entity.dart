import 'package:equatable/equatable.dart';

class BusinessCategoryEntity extends Equatable {
  final int id;
  final String? description;

  const BusinessCategoryEntity({
    required this.id,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        description,
      ];
}
