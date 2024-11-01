// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationController on AuthenticationControllerAbstract, Store {
  late final _$isLoadingAtom = Atom(
      name: 'AuthenticationControllerAbstract.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: 'AuthenticationControllerAbstract.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'AuthenticationControllerAbstract.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: 'AuthenticationControllerAbstract.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthenticationControllerAbstract.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$retypePasswordAtom = Atom(
      name: 'AuthenticationControllerAbstract.retypePassword',
      context: context);

  @override
  String get retypePassword {
    _$retypePasswordAtom.reportRead();
    return super.retypePassword;
  }

  @override
  set retypePassword(String value) {
    _$retypePasswordAtom.reportWrite(value, super.retypePassword, () {
      super.retypePassword = value;
    });
  }

  late final _$temporaryPasswordAtom = Atom(
      name: 'AuthenticationControllerAbstract.temporaryPassword',
      context: context);

  @override
  String get temporaryPassword {
    _$temporaryPasswordAtom.reportRead();
    return super.temporaryPassword;
  }

  @override
  set temporaryPassword(String value) {
    _$temporaryPasswordAtom.reportWrite(value, super.temporaryPassword, () {
      super.temporaryPassword = value;
    });
  }

  late final _$accessStatusAtom = Atom(
      name: 'AuthenticationControllerAbstract.accessStatus', context: context);

  @override
  String get accessStatus {
    _$accessStatusAtom.reportRead();
    return super.accessStatus;
  }

  @override
  set accessStatus(String value) {
    _$accessStatusAtom.reportWrite(value, super.accessStatus, () {
      super.accessStatus = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'AuthenticationControllerAbstract.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
token: ${token},
name: ${name},
username: ${username},
password: ${password},
retypePassword: ${retypePassword},
temporaryPassword: ${temporaryPassword},
accessStatus: ${accessStatus},
errorMessage: ${errorMessage}
    ''';
  }
}
