import 'package:equatable/equatable.dart';

class AuthenticationParams extends Equatable {
  final String? password;
  final String username;

  const AuthenticationParams({this.password, required this.username});

  @override
  List<Object?> get props => [password, username];
}
