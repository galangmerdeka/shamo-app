import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shamo_app/domain/auth/model/login_request.dart';
import 'package:shamo_app/domain/auth/model/login_response.dart';
import 'package:shamo_app/infrastructure/auth/auth_repository.dart';

part 'auth_state.dart';
// part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async {
    emit(AuthLoading());
    try {
      final _data = await _authRepository.signInUser(loginRequest);
      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
