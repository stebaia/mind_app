part of 'login_bloc.dart';

class LoginInEvent extends Equatable {
  final String email;
  final String password;
  

  const LoginInEvent(
      {required this.email, required this.password, });

  @override
  List<Object> get props => [email, password];
}
