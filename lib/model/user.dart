import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String birth;
  final String registrationDate;
  final String lastLogin;
  String? token;

  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.email,
      required this.birth,
      required this.registrationDate,
      required this.lastLogin,
      this.token});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, registrationDate, lastLogin, surname, email, birth, token];
}
