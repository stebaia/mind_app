import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mind_app/model/user.dart';
import 'package:mind_app/repositories/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserRepository userRepository;
  final BuildContext context;
  AuthCubit({required this.userRepository, required this.context})
      : super(const CheckAuthenticationState());

  void checkAuthenticationState() async {
    final user = await userRepository.currentUser;
    emit(user != null
        ? AuthenticatedState(user)
        : const NotAuthenticatedState());
  }

  void authenticated(User user) => emit(AuthenticatedState(user));

  /*void singOut(bool force) async {
    final user = await userRepository.logout(force, context);
    if (!force) {
      checkAuthenticationState();
    } else {
      emit(const NotAuthenticatedState());
    }
  }*/
}
