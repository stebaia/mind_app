import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class RegistrationRequest extends DTO with EquatableMixin {
  static const _emailKey = 'email';
  static const _passwordKey = 'password';
  static const _timestamp = "timestamp";
  static const _name = "name";
  static const _surname = "surname";
  static const _username = "username";
  static const _birth = "birth";

  final String username;
  final String password;
  final String timestamp;
  final String name;
  final String surname;
  final String birth;
  final String email;

  RegistrationRequest(
      {required this.username,
      required this.password,
      required this.timestamp,
      required this.name,
      required this.surname,
      required this.email,
      required this.birth});

  Map<String, dynamic> toJson() => {
        _emailKey: email,
        _passwordKey: password,
        _timestamp: timestamp,
        _name: name,
        _birth: birth,
        _username: username,
        _surname: surname
      };

  @override
  List<Object?> get props => [email, password, timestamp, name];
}
