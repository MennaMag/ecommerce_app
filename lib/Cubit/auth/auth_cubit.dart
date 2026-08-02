import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login() {
    emit(AuthLoading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(AuthSuccess());
    });
  }

  void register() {
    emit(AuthLoading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(AuthSuccess());
    });
  }

  void logout() {
    emit(AuthInitial());
  }
}