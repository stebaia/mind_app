part of 'login_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginInEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class RegistrationEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String username;
  final String surname;
  final String birth;

  const RegistrationEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.birth,
      required this.surname,
      required this.username});

  @override
  List<Object> get props => [email, password, name, username, surname, birth];
}
