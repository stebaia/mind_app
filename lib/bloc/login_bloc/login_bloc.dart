import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mind_app/model/user.dart';
import 'package:mind_app/repositories/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, LoginInState> {
  final UserRepository userRepository;

  LoginBloc({
    required this.userRepository,
  }) : super(const NotLoginInState()) {
    on<LoginInEvent>(_loginIn);
    on<RegistrationEvent>(_registration);
  }

  void loginIn({
    required String email,
    required String password,
  }) =>
      add(LoginInEvent(
        email: email,
        password: password,
      ));

  FutureOr<void> _loginIn(
      LoginInEvent event, Emitter<LoginInState> emitter) async {
    emit(const TryLogginInState());
    try {
      final user = await userRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(LoggedInState(user));
    } catch (e) {
      emit(const ErrorLoginInState());
    }
  }

  void registration(
          {required String email,
          required String password,
          required String name}) =>
      add(RegistrationEvent(email: email, password: password, name: name));

  FutureOr<void> _registration(
      RegistrationEvent event, Emitter<LoginInState> emitter) async {
    emit(const TryLogginInState());
    try {
      final user = await userRepository.registration(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(LoggedInState(user));
    } catch (e) {
      emit(const ErrorLoginInState());
    }
  }
}
