import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(LoginState.initial());
  final AuthRepository _authRepository;

  void emailChanged(String value) {
    // print(value);
    emit(state.copyWith(email: value, loginStatus: LoginStatus.initial));
  }

  void displayNameChanged(String value) {
    emit(state.copyWith(displayName: value, loginStatus: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, loginStatus: LoginStatus.initial));
  }

  Future<void> logout() async {
    emit(state.copyWith(
        email: '', password: '', loginStatus: LoginStatus.initial));
    await _authRepository.logout();
  }

  Future<void> login() async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.submitted));
      await _authRepository.login(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(state.copyWith(loginStatus: LoginStatus.userNotFound));
          break;
        case 'wrong-password':
          emit(state.copyWith(loginStatus: LoginStatus.wrongPassword));
          break;
      }
      emit(state.copyWith(loginStatus: LoginStatus.error));
    } catch (_) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }

  Future<void> register() async {
    try {
      emit(state.copyWith(loginStatus: LoginStatus.submitted));
      await _authRepository.register(
        email: state.email,
        password: state.password,
        displayName: state.displayName,
      );
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(state.copyWith(loginStatus: LoginStatus.emailAlreadyInUse));
          break;
        case 'invalid-email':
          emit(state.copyWith(loginStatus: LoginStatus.invalidEmail));
          break;
        case 'weak-password':
          emit(state.copyWith(loginStatus: LoginStatus.weakPassword));
          break;
      }
      emit(state.copyWith(loginStatus: LoginStatus.error));
    } catch (_) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }
}
