part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errMessage;
  AuthError(this.errMessage);
}

class AuthSuccess extends AuthState {
  final LoginResponse loginResponse;
  AuthSuccess(this.loginResponse);
}
