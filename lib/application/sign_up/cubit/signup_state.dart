part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String errMessage;
  SignUpError(this.errMessage);
}

class SignUpSuccess extends SignUpState {
  final SignUpResponse signUpResponse;
  SignUpSuccess(this.signUpResponse);
}
