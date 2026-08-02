import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void getProfile() {
    emit(ProfileLoading());

    Future.delayed(const Duration(seconds: 2), () {
      emit(ProfileSuccess());
    });
  }
}