import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class RegistrationRequest extends DTO with EquatableMixin {
  static const _emailKey = 'username';
  static const _passwordKey = 'password';
  static const _timestamp = "timestamp";
  static const _name = "name";

  final String email;
  final String password;
  final String timestamp;
  final String name;

  RegistrationRequest(
      {required this.email,
      required this.password,
      required this.timestamp,
      required this.name});

  Map<String, dynamic> toJson() => {
        _emailKey: email,
        _passwordKey: password,
        _timestamp: timestamp,
        _name: name
      };

  @override
  List<Object?> get props => [email, password, timestamp, name];
}
