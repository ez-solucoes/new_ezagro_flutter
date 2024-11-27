import 'package:equatable/equatable.dart';

class UserParams extends Equatable {
  final int? id;
  final String? password;

  const UserParams({this.id, this.password});

  @override
  List<Object?> get props => [id, password];
}
