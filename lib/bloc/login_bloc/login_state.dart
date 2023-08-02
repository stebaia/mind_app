part of 'login_bloc.dart';

@immutable
abstract class LoginInState extends Equatable {
  const LoginInState();

  @override
  List<Object> get props => [];
}

class NotLoginInState extends LoginInState {
  const NotLoginInState();
}

class TryLogginInState extends LoginInState {
  const TryLogginInState();
}

class TryToRegister extends LoginInState {
  const TryToRegister();
}

class RegistrationDoneState extends LoginInState {
  final User user;
  const RegistrationDoneState(this.user);

  List<Object> get props => [user];
}

class LoggedInState extends LoginInState {
  final User user;
  const LoggedInState(this.user);

  List<Object> get props => [user];
}

class ErrorLoginInState extends LoginInState {
  final String errorString;

  const ErrorLoginInState(this.errorString);
  List<Object> get props => [errorString];
}
