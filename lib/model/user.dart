import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String birth;
  final String registration;
  final String lastLogin;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.birth,
    required this.registration,
    required this.lastLogin,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, registration, lastLogin, surname, email, birth];
}
