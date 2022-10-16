import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shamo_app/domain/sign_up/sign_up_request.dart';
import 'package:shamo_app/domain/sign_up/sign_up_response.dart';
import 'package:shamo_app/infrastructure/sign_up/sign_up_repository.dart';

part 'signup_state.dart';
// part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(SignUpInitial());

  final SignUpRepository _signUpRepository = SignUpRepository();

  void signUpUser(SignUpRequest signUpRequest) async {
    emit(SignUpLoading());
    try {
      final _data = await _signUpRepository.signUpUser(signUpRequest);
      _data.fold(
        (l) => emit(SignUpError(l)),
        (r) => emit(SignUpSuccess(r)),
      );
    } catch (e) {
      emit(SignUpError(e.toString()));
    }
  }
}
